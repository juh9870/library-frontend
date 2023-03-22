import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/generated/library.swagger.dart';

SharedPreferences? prefs;
const accessTokenKey = 'auth_token';
const refreshTokenKey = 'refresh_token';

const apiBaseUri = 'http://localhost:3000';

class LoginNotifier extends StateNotifier<UserEntity?> {
  LoginNotifier(super.state);

  get user => state;

  Future<void> logout() async {
    await (await SharedPreferences.getInstance()).clear();
    state = null;
  }

  Future<UserEntity?> login(String username, String password) async {
    final response = await apiClient.authLoginPost(
        body: LoginDto(username: username, password: password));
    final tokens = response.body;
    if (tokens == null) {
      throw Exception("Unauthorized");
    }

    await _storeData(refreshTokenKey, tokens.refreshToken);
    await _storeData(accessTokenKey, tokens.accessToken);
    final user = await apiClient.usersMeGet();
    if (user.body == null) throw Exception("Failed to fetch self");
    state = user.body;
    return state!;
  }

  Future<void> register(String username, String password) async {
    final response = await apiClient.authRegisterPost(
        body: RegisterDto(username: username, password: password));
    if (response.statusCode >= 400) {
      throw Exception("Unauthorized");
    }
  }

  Future<UserEntity?> tryLoginFromStorage() async {
    final user = await apiClient.usersMeGet();
    state = user.body;
    return state;
  }
}

final LoginNotifier loginNotifier = LoginNotifier(null);

final loginProvider =
    StateNotifierProvider<LoginNotifier, UserEntity?>((ref) => loginNotifier);

Future<void> _storeData(String key, String value) async {
  prefs ??= await SharedPreferences.getInstance();
  await prefs!.setString(key, value);
}

Map<String, String> authHeaders(
    {Map<String, String>? outMap, bool isRefresh = false}) {
  outMap ??= {};
  if (prefs == null) throw Exception("Preferences aren't ready");
  final token = prefs!.getString(isRefresh ? refreshTokenKey : accessTokenKey);
  if (token == null) return outMap;
  outMap['Authorization'] = 'Bearer $token';
  return outMap;
}

String bookCoverUrl(BookEntity book) {
  return '$apiBaseUri/books/${book.id}/cover';
}

final apiClient = Library.create(
    baseUrl: Uri.parse(apiBaseUri),
    authenticator: AppAuthenticator(),
    interceptors: [
      (Request request) async {
        prefs ??= await SharedPreferences.getInstance();
        late Map<String, String> headers;
        if (request.uri.toString().contains('auth/refresh')) {
          headers = authHeaders(
              outMap: Map<String, String>.of(request.headers), isRefresh: true);
        } else {
          headers =
              authHeaders(outMap: Map<String, String>.of(request.headers));
        }
        return applyHeaders(request, headers);
      }
    ]);

class AppAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      if (!request.uri.toString().contains('auth/refresh')) {
        prefs ??= await SharedPreferences.getInstance();
        var tokensReq = await apiClient.authRefreshPost();
        final tokens = tokensReq.body;
        if (tokens != null) {
          await _storeData(accessTokenKey, tokens.accessToken);
          request.headers.remove('Authorization');
          request.headers.putIfAbsent(
              'Authorization', () => 'Bearer ${tokens.accessToken}');
          return request;
        }
      }

      await loginNotifier.logout();
      return null;
    }
    return null;
  }
}
