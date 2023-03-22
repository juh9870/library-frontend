// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Library extends Library {
  _$Library([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Library;

  @override
  Future<Response<RefreshTokenDto>> _authLoginPost({required LoginDto? body}) {
    final Uri $url = Uri.parse('/auth/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RefreshTokenDto, RefreshTokenDto>($request);
  }

  @override
  Future<Response<AuthTokenDto>> _authRefreshPost() {
    final Uri $url = Uri.parse('/auth/refresh');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<AuthTokenDto, AuthTokenDto>($request);
  }

  @override
  Future<Response<UserEntity>> _authRegisterPost({required RegisterDto? body}) {
    final Uri $url = Uri.parse('/auth/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserEntity, UserEntity>($request);
  }

  @override
  Future<Response<dynamic>> _authLogoutGet() {
    final Uri $url = Uri.parse('/auth/logout');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserEntity>> _usersMeGet() {
    final Uri $url = Uri.parse('/users/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserEntity, UserEntity>($request);
  }

  @override
  Future<Response<UserEntity>> _usersIdGet({required String? id}) {
    final Uri $url = Uri.parse('/users/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserEntity, UserEntity>($request);
  }

  @override
  Future<Response<List<UserEntity>>> _usersGet() {
    final Uri $url = Uri.parse('/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserEntity>, UserEntity>($request);
  }

  @override
  Future<Response<UserEntity>> _usersIdPermissionsPut({
    required String? id,
    required SetPermissionsDto? body,
  }) {
    final Uri $url = Uri.parse('/users/${id}/permissions');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserEntity, UserEntity>($request);
  }

  @override
  Future<Response<List<BookEntity>>> _booksGet({String? tags}) {
    final Uri $url = Uri.parse('/books');
    final Map<String, dynamic> $params = <String, dynamic>{'tags': tags};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<BookEntity>, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksPost({required CreateBookDto? body}) {
    final Uri $url = Uri.parse('/books');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<List<BookEntity>>> _booksDraftsGet() {
    final Uri $url = Uri.parse('/books/drafts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<BookEntity>, BookEntity>($request);
  }

  @override
  Future<Response<List<BookEntity>>> _booksPendingGet() {
    final Uri $url = Uri.parse('/books/pending');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<BookEntity>, BookEntity>($request);
  }

  @override
  Future<Response<List<BookEntity>>> _booksArchivedGet() {
    final Uri $url = Uri.parse('/books/archived');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<BookEntity>, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdGet({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdPatch({
    required String? id,
    required UpdateBookDto? body,
  }) {
    final Uri $url = Uri.parse('/books/${id}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<dynamic>> _booksIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> _booksIdCoverGet({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/cover');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdCoverPost({
    required String? id,
    required List<int> image,
  }) {
    final Uri $url = Uri.parse('/books/${id}/cover');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>>(
        'file',
        image,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<String>> _booksIdFileGet({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/file');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdFilePost({
    required String? id,
    required FileUploadDto body,
  }) {
    final Uri $url = Uri.parse('/books/${id}/file');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdSubmitPost({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/submit');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdApprovePost({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/approve');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdRejectPost({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/reject');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdArchivePost({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/archive');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }

  @override
  Future<Response<BookEntity>> _booksIdUnarchivePost({required String? id}) {
    final Uri $url = Uri.parse('/books/${id}/unarchive');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<BookEntity, BookEntity>($request);
  }
}
