// ignore_for_file: type=lint

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'library.enums.swagger.dart' as enums;
export 'library.enums.swagger.dart';

part 'library.swagger.chopper.dart';
part 'library.swagger.g.dart';

typedef SetPermissionsDto = enums.SetPermissionsDto;

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Library extends ChopperService {
  static Library create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Library(client);
    }

    final newClient = ChopperClient(
        services: [_$Library()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Library(newClient);
  }

  ///
  Future<chopper.Response<RefreshTokenDto>> authLoginPost(
      {required LoginDto? body}) {
    generatedMapping.putIfAbsent(
        RefreshTokenDto, () => RefreshTokenDto.fromJsonFactory);

    return _authLoginPost(body: body);
  }

  ///
  @Post(
    path: '/auth/login',
    optionalBody: true,
  )
  Future<chopper.Response<RefreshTokenDto>> _authLoginPost(
      {@Body() required LoginDto? body});

  ///
  Future<chopper.Response<AuthTokenDto>> authRefreshPost() {
    generatedMapping.putIfAbsent(
        AuthTokenDto, () => AuthTokenDto.fromJsonFactory);

    return _authRefreshPost();
  }

  ///
  @Post(
    path: '/auth/refresh',
    optionalBody: true,
  )
  Future<chopper.Response<AuthTokenDto>> _authRefreshPost();

  ///
  Future<chopper.Response<UserEntity>> authRegisterPost(
      {required RegisterDto? body}) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _authRegisterPost(body: body);
  }

  ///
  @Post(
    path: '/auth/register',
    optionalBody: true,
  )
  Future<chopper.Response<UserEntity>> _authRegisterPost(
      {@Body() required RegisterDto? body});

  ///
  Future<chopper.Response> authLogoutGet() {
    return _authLogoutGet();
  }

  ///
  @Get(path: '/auth/logout')
  Future<chopper.Response> _authLogoutGet();

  ///
  Future<chopper.Response<UserEntity>> usersMeGet() {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _usersMeGet();
  }

  ///
  @Get(path: '/users/me')
  Future<chopper.Response<UserEntity>> _usersMeGet();

  ///
  ///@param id
  Future<chopper.Response<UserEntity>> usersIdGet({required String? id}) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _usersIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/users/{id}')
  Future<chopper.Response<UserEntity>> _usersIdGet(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<UserEntity>>> usersGet() {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _usersGet();
  }

  ///
  @Get(path: '/users')
  Future<chopper.Response<List<UserEntity>>> _usersGet();

  ///
  ///@param id
  Future<chopper.Response<UserEntity>> usersIdPermissionsPut({
    required String? id,
    required SetPermissionsDto? body,
  }) {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _usersIdPermissionsPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/users/{id}/permissions',
    optionalBody: true,
  )
  Future<chopper.Response<UserEntity>> _usersIdPermissionsPut({
    @Path('id') required String? id,
    @Body() required SetPermissionsDto? body,
  });

  ///
  ///@param tags
  Future<chopper.Response<List<BookEntity>>> booksGet({String? tags}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksGet(tags: tags);
  }

  ///
  ///@param tags
  @Get(path: '/books')
  Future<chopper.Response<List<BookEntity>>> _booksGet(
      {@Query('tags') String? tags});

  ///
  Future<chopper.Response<BookEntity>> booksPost(
      {required CreateBookDto? body}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksPost(body: body);
  }

  ///
  @Post(
    path: '/books',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksPost(
      {@Body() required CreateBookDto? body});

  ///
  Future<chopper.Response<List<BookEntity>>> booksDraftsGet() {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksDraftsGet();
  }

  ///
  @Get(path: '/books/drafts')
  Future<chopper.Response<List<BookEntity>>> _booksDraftsGet();

  ///
  Future<chopper.Response<List<BookEntity>>> booksPendingGet() {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksPendingGet();
  }

  ///
  @Get(path: '/books/pending')
  Future<chopper.Response<List<BookEntity>>> _booksPendingGet();

  ///
  Future<chopper.Response<List<BookEntity>>> booksArchivedGet() {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksArchivedGet();
  }

  ///
  @Get(path: '/books/archived')
  Future<chopper.Response<List<BookEntity>>> _booksArchivedGet();

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdGet({required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/books/{id}')
  Future<chopper.Response<BookEntity>> _booksIdGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdPatch({
    required String? id,
    required UpdateBookDto? body,
  }) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(
    path: '/books/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdPatch({
    @Path('id') required String? id,
    @Body() required UpdateBookDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> booksIdDelete({required String? id}) {
    return _booksIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/books/{id}')
  Future<chopper.Response> _booksIdDelete({@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<String>> booksIdCoverGet({required String? id}) {
    return _booksIdCoverGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/books/{id}/cover')
  Future<chopper.Response<String>> _booksIdCoverGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdCoverPost({
    required String? id,
    required List<int> image,
  }) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdCoverPost(id: id, image: image);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/cover',
  )
  @multipart
  Future<chopper.Response<BookEntity>> _booksIdCoverPost({
    @Path('id') required String? id,
    @PartFile('file') required List<int> image,
  });

  ///
  ///@param id
  Future<chopper.Response<String>> booksIdFileGet({required String? id}) {
    return _booksIdFileGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/books/{id}/file')
  Future<chopper.Response<String>> _booksIdFileGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdFilePost({
    required String? id,
    required FileUploadDto body,
  }) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdFilePost(id: id, body: body);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/file',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdFilePost({
    @Path('id') required String? id,
    @Part() required FileUploadDto body,
  });

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdSubmitPost(
      {required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdSubmitPost(id: id);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/submit',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdSubmitPost(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdApprovePost(
      {required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdApprovePost(id: id);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/approve',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdApprovePost(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdRejectPost(
      {required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdRejectPost(id: id);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/reject',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdRejectPost(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdArchivePost(
      {required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdArchivePost(id: id);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdArchivePost(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<BookEntity>> booksIdUnarchivePost(
      {required String? id}) {
    generatedMapping.putIfAbsent(BookEntity, () => BookEntity.fromJsonFactory);

    return _booksIdUnarchivePost(id: id);
  }

  ///
  ///@param id
  @Post(
    path: '/books/{id}/unarchive',
    optionalBody: true,
  )
  Future<chopper.Response<BookEntity>> _booksIdUnarchivePost(
      {@Path('id') required String? id});
}

@JsonSerializable(explicitToJson: true)
class LoginDto {
  LoginDto({
    required this.username,
    required this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$LoginDtoFromJson;
  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? username, String? password}) {
    return LoginDto(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String>? username, Wrapped<String>? password}) {
    return LoginDto(
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class RefreshTokenDto {
  RefreshTokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDtoFromJson(json);

  @JsonKey(name: 'accessToken')
  final String accessToken;
  @JsonKey(name: 'refreshToken')
  final String refreshToken;
  static const fromJsonFactory = _$RefreshTokenDtoFromJson;
  static const toJsonFactory = _$RefreshTokenDtoToJson;
  Map<String, dynamic> toJson() => _$RefreshTokenDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshTokenDto &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      runtimeType.hashCode;
}

extension $RefreshTokenDtoExtension on RefreshTokenDto {
  RefreshTokenDto copyWith({String? accessToken, String? refreshToken}) {
    return RefreshTokenDto(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken);
  }

  RefreshTokenDto copyWithWrapped(
      {Wrapped<String>? accessToken, Wrapped<String>? refreshToken}) {
    return RefreshTokenDto(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthTokenDto {
  AuthTokenDto({
    required this.accessToken,
  });

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDtoFromJson(json);

  @JsonKey(name: 'accessToken')
  final String accessToken;
  static const fromJsonFactory = _$AuthTokenDtoFromJson;
  static const toJsonFactory = _$AuthTokenDtoToJson;
  Map<String, dynamic> toJson() => _$AuthTokenDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthTokenDto &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^ runtimeType.hashCode;
}

extension $AuthTokenDtoExtension on AuthTokenDto {
  AuthTokenDto copyWith({String? accessToken}) {
    return AuthTokenDto(accessToken: accessToken ?? this.accessToken);
  }

  AuthTokenDto copyWithWrapped({Wrapped<String>? accessToken}) {
    return AuthTokenDto(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken));
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterDto {
  RegisterDto({
    required this.username,
    required this.password,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$RegisterDtoFromJson;
  static const toJsonFactory = _$RegisterDtoToJson;
  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterDto &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $RegisterDtoExtension on RegisterDto {
  RegisterDto copyWith({String? username, String? password}) {
    return RegisterDto(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  RegisterDto copyWithWrapped(
      {Wrapped<String>? username, Wrapped<String>? password}) {
    return RegisterDto(
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class UserEntity {
  UserEntity({
    required this.permissions,
    required this.id,
    required this.createdAt,
    required this.username,
    required this.passwordHash,
    required this.lastTokenReset,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  @JsonKey(
    name: 'permissions',
    toJson: userEntityPermissionsListToJson,
    fromJson: userEntityPermissionsListFromJson,
  )
  final List<enums.UserEntityPermissions> permissions;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'passwordHash')
  final String passwordHash;
  @JsonKey(name: 'lastTokenReset')
  final DateTime? lastTokenReset;
  static const fromJsonFactory = _$UserEntityFromJson;
  static const toJsonFactory = _$UserEntityToJson;
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserEntity &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality()
                    .equals(other.permissions, permissions)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.passwordHash, passwordHash) ||
                const DeepCollectionEquality()
                    .equals(other.passwordHash, passwordHash)) &&
            (identical(other.lastTokenReset, lastTokenReset) ||
                const DeepCollectionEquality()
                    .equals(other.lastTokenReset, lastTokenReset)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(permissions) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(passwordHash) ^
      const DeepCollectionEquality().hash(lastTokenReset) ^
      runtimeType.hashCode;
}

extension $UserEntityExtension on UserEntity {
  UserEntity copyWith(
      {List<enums.UserEntityPermissions>? permissions,
      String? id,
      DateTime? createdAt,
      String? username,
      String? passwordHash,
      DateTime? lastTokenReset}) {
    return UserEntity(
        permissions: permissions ?? this.permissions,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        username: username ?? this.username,
        passwordHash: passwordHash ?? this.passwordHash,
        lastTokenReset: lastTokenReset ?? this.lastTokenReset);
  }

  UserEntity copyWithWrapped(
      {Wrapped<List<enums.UserEntityPermissions>>? permissions,
      Wrapped<String>? id,
      Wrapped<DateTime?>? createdAt,
      Wrapped<String>? username,
      Wrapped<String>? passwordHash,
      Wrapped<DateTime?>? lastTokenReset}) {
    return UserEntity(
        permissions:
            (permissions != null ? permissions.value : this.permissions),
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        username: (username != null ? username.value : this.username),
        passwordHash:
            (passwordHash != null ? passwordHash.value : this.passwordHash),
        lastTokenReset: (lastTokenReset != null
            ? lastTokenReset.value
            : this.lastTokenReset));
  }
}

@JsonSerializable(explicitToJson: true)
class BookEntity {
  BookEntity({
    required this.state,
    required this.id,
    required this.title,
    required this.imageFile,
    required this.bookFile,
    required this.description,
    required this.publishedDate,
    required this.userId,
    required this.tags,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);

  @JsonKey(
    name: 'state',
    toJson: bookEntityStateToJson,
    fromJson: bookEntityStateFromJson,
  )
  final enums.BookEntityState state;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'imageFile')
  final String? imageFile;
  @JsonKey(name: 'bookFile')
  final String? bookFile;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'published_date')
  final DateTime? publishedDate;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'tags', defaultValue: <BookEntity$Tags$Item>[])
  final BookEntity$Tags tags;
  static const fromJsonFactory = _$BookEntityFromJson;
  static const toJsonFactory = _$BookEntityToJson;
  Map<String, dynamic> toJson() => _$BookEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookEntity &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.bookFile, bookFile) ||
                const DeepCollectionEquality()
                    .equals(other.bookFile, bookFile)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.publishedDate, publishedDate) ||
                const DeepCollectionEquality()
                    .equals(other.publishedDate, publishedDate)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(bookFile) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(publishedDate) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(tags) ^
      runtimeType.hashCode;
}

extension $BookEntityExtension on BookEntity {
  BookEntity copyWith(
      {enums.BookEntityState? state,
      String? id,
      String? title,
      String? imageFile,
      String? bookFile,
      String? description,
      DateTime? publishedDate,
      String? userId,
      BookEntity$Tags? tags}) {
    return BookEntity(
        state: state ?? this.state,
        id: id ?? this.id,
        title: title ?? this.title,
        imageFile: imageFile ?? this.imageFile,
        bookFile: bookFile ?? this.bookFile,
        description: description ?? this.description,
        publishedDate: publishedDate ?? this.publishedDate,
        userId: userId ?? this.userId,
        tags: tags ?? this.tags);
  }

  BookEntity copyWithWrapped(
      {Wrapped<enums.BookEntityState>? state,
      Wrapped<String>? id,
      Wrapped<String>? title,
      Wrapped<String?>? imageFile,
      Wrapped<String?>? bookFile,
      Wrapped<String>? description,
      Wrapped<DateTime?>? publishedDate,
      Wrapped<String?>? userId,
      Wrapped<BookEntity$Tags>? tags}) {
    return BookEntity(
        state: (state != null ? state.value : this.state),
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        bookFile: (bookFile != null ? bookFile.value : this.bookFile),
        description:
            (description != null ? description.value : this.description),
        publishedDate:
            (publishedDate != null ? publishedDate.value : this.publishedDate),
        userId: (userId != null ? userId.value : this.userId),
        tags: (tags != null ? tags.value : this.tags));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateBookDto {
  CreateBookDto({
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.tags,
  });

  factory CreateBookDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBookDtoFromJson(json);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'published_date')
  final DateTime? publishedDate;
  @JsonKey(name: 'tags', defaultValue: <CreateBookDto$Tags$Item>[])
  final List<CreateBookDto$Tags$Item> tags;
  static const fromJsonFactory = _$CreateBookDtoFromJson;
  static const toJsonFactory = _$CreateBookDtoToJson;
  Map<String, dynamic> toJson() => _$CreateBookDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateBookDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.publishedDate, publishedDate) ||
                const DeepCollectionEquality()
                    .equals(other.publishedDate, publishedDate)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(publishedDate) ^
      const DeepCollectionEquality().hash(tags) ^
      runtimeType.hashCode;
}

extension $CreateBookDtoExtension on CreateBookDto {
  CreateBookDto copyWith(
      {String? title,
      String? description,
      DateTime? publishedDate,
      List<CreateBookDto$Tags$Item>? tags}) {
    return CreateBookDto(
        title: title ?? this.title,
        description: description ?? this.description,
        publishedDate: publishedDate ?? this.publishedDate,
        tags: tags ?? this.tags);
  }

  CreateBookDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime?>? publishedDate,
      Wrapped<List<CreateBookDto$Tags$Item>>? tags}) {
    return CreateBookDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        publishedDate:
            (publishedDate != null ? publishedDate.value : this.publishedDate),
        tags: (tags != null ? tags.value : this.tags));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateBookDto {
  UpdateBookDto({
    this.title,
    this.description,
    this.publishedDate,
    this.tags,
  });

  factory UpdateBookDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookDtoFromJson(json);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'published_date')
  final DateTime? publishedDate;
  @JsonKey(name: 'tags', defaultValue: <UpdateBookDto$Tags$Item>[])
  final List<UpdateBookDto$Tags$Item>? tags;
  static const fromJsonFactory = _$UpdateBookDtoFromJson;
  static const toJsonFactory = _$UpdateBookDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateBookDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateBookDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.publishedDate, publishedDate) ||
                const DeepCollectionEquality()
                    .equals(other.publishedDate, publishedDate)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(publishedDate) ^
      const DeepCollectionEquality().hash(tags) ^
      runtimeType.hashCode;
}

extension $UpdateBookDtoExtension on UpdateBookDto {
  UpdateBookDto copyWith(
      {String? title,
      String? description,
      DateTime? publishedDate,
      List<UpdateBookDto$Tags$Item>? tags}) {
    return UpdateBookDto(
        title: title ?? this.title,
        description: description ?? this.description,
        publishedDate: publishedDate ?? this.publishedDate,
        tags: tags ?? this.tags);
  }

  UpdateBookDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? publishedDate,
      Wrapped<List<UpdateBookDto$Tags$Item>?>? tags}) {
    return UpdateBookDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        publishedDate:
            (publishedDate != null ? publishedDate.value : this.publishedDate),
        tags: (tags != null ? tags.value : this.tags));
  }
}

@JsonSerializable(explicitToJson: true)
class FileUploadDto {
  FileUploadDto({
    required this.file,
  });

  factory FileUploadDto.fromJson(Map<String, dynamic> json) =>
      _$FileUploadDtoFromJson(json);

  @JsonKey(name: 'file')
  final String file;
  static const fromJsonFactory = _$FileUploadDtoFromJson;
  static const toJsonFactory = _$FileUploadDtoToJson;
  Map<String, dynamic> toJson() => _$FileUploadDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FileUploadDto &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $FileUploadDtoExtension on FileUploadDto {
  FileUploadDto copyWith({String? file}) {
    return FileUploadDto(file: file ?? this.file);
  }

  FileUploadDto copyWithWrapped({Wrapped<String>? file}) {
    return FileUploadDto(file: (file != null ? file.value : this.file));
  }
}

typedef BookEntity$Tags = List<BookEntity$Tags$Item>;

@JsonSerializable(explicitToJson: true)
class BookEntity$Tags$Item {
  BookEntity$Tags$Item({
    required this.type,
    required this.name,
  });

  factory BookEntity$Tags$Item.fromJson(Map<String, dynamic> json) =>
      _$BookEntity$Tags$ItemFromJson(json);

  @JsonKey(
    name: 'type',
    toJson: bookEntity$Tags$ItemTypeToJson,
    fromJson: bookEntity$Tags$ItemTypeFromJson,
  )
  final enums.BookEntity$Tags$ItemType type;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$BookEntity$Tags$ItemFromJson;
  static const toJsonFactory = _$BookEntity$Tags$ItemToJson;
  Map<String, dynamic> toJson() => _$BookEntity$Tags$ItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookEntity$Tags$Item &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $BookEntity$Tags$ItemExtension on BookEntity$Tags$Item {
  BookEntity$Tags$Item copyWith(
      {enums.BookEntity$Tags$ItemType? type, String? name}) {
    return BookEntity$Tags$Item(
        type: type ?? this.type, name: name ?? this.name);
  }

  BookEntity$Tags$Item copyWithWrapped(
      {Wrapped<enums.BookEntity$Tags$ItemType>? type, Wrapped<String>? name}) {
    return BookEntity$Tags$Item(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name));
  }
}

typedef CreateBookDto$Tags = List<CreateBookDto$Tags$Item>;

@JsonSerializable(explicitToJson: true)
class CreateBookDto$Tags$Item {
  CreateBookDto$Tags$Item({
    required this.type,
    required this.name,
  });

  factory CreateBookDto$Tags$Item.fromJson(Map<String, dynamic> json) =>
      _$CreateBookDto$Tags$ItemFromJson(json);

  @JsonKey(
    name: 'type',
    toJson: createBookDto$Tags$ItemTypeToJson,
    fromJson: createBookDto$Tags$ItemTypeFromJson,
  )
  final enums.BookEntity$Tags$ItemType type;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$CreateBookDto$Tags$ItemFromJson;
  static const toJsonFactory = _$CreateBookDto$Tags$ItemToJson;
  Map<String, dynamic> toJson() => _$CreateBookDto$Tags$ItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateBookDto$Tags$Item &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CreateBookDto$Tags$ItemExtension on CreateBookDto$Tags$Item {
  CreateBookDto$Tags$Item copyWith(
      {enums.BookEntity$Tags$ItemType? type, String? name}) {
    return CreateBookDto$Tags$Item(
        type: type ?? this.type, name: name ?? this.name);
  }

  CreateBookDto$Tags$Item copyWithWrapped(
      {Wrapped<enums.BookEntity$Tags$ItemType>? type,
      Wrapped<String>? name}) {
    return CreateBookDto$Tags$Item(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name));
  }
}

typedef UpdateBookDto$Tags = List<UpdateBookDto$Tags$Item>;

@JsonSerializable(explicitToJson: true)
class UpdateBookDto$Tags$Item {
  UpdateBookDto$Tags$Item({
    required this.type,
    required this.name,
  });

  factory UpdateBookDto$Tags$Item.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookDto$Tags$ItemFromJson(json);

  @JsonKey(
    name: 'type',
    toJson: updateBookDto$Tags$ItemTypeToJson,
    fromJson: updateBookDto$Tags$ItemTypeFromJson,
  )
  final enums.BookEntity$Tags$ItemType type;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$UpdateBookDto$Tags$ItemFromJson;
  static const toJsonFactory = _$UpdateBookDto$Tags$ItemToJson;
  Map<String, dynamic> toJson() => _$UpdateBookDto$Tags$ItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateBookDto$Tags$Item &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $UpdateBookDto$Tags$ItemExtension on UpdateBookDto$Tags$Item {
  UpdateBookDto$Tags$Item copyWith(
      {enums.BookEntity$Tags$ItemType? type, String? name}) {
    return UpdateBookDto$Tags$Item(
        type: type ?? this.type, name: name ?? this.name);
  }

  UpdateBookDto$Tags$Item copyWithWrapped(
      {Wrapped<enums.BookEntity$Tags$ItemType>? type,
      Wrapped<String>? name}) {
    return UpdateBookDto$Tags$Item(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name));
  }
}

String? userEntityPermissionsToJson(
    enums.UserEntityPermissions? userEntityPermissions) {
  return userEntityPermissions?.value;
}

enums.UserEntityPermissions userEntityPermissionsFromJson(
  Object? userEntityPermissions, [
  enums.UserEntityPermissions? defaultValue,
]) {
  return enums.UserEntityPermissions.values
          .firstWhereOrNull((e) => e.value == userEntityPermissions) ??
      defaultValue ??
      enums.UserEntityPermissions.swaggerGeneratedUnknown;
}

List<String> userEntityPermissionsListToJson(
    List<enums.UserEntityPermissions>? userEntityPermissions) {
  if (userEntityPermissions == null) {
    return [];
  }

  return userEntityPermissions.map((e) => e.value!).toList();
}

List<enums.UserEntityPermissions> userEntityPermissionsListFromJson(
  List? userEntityPermissions, [
  List<enums.UserEntityPermissions>? defaultValue,
]) {
  if (userEntityPermissions == null) {
    return defaultValue ?? [];
  }

  return userEntityPermissions
      .map((e) => userEntityPermissionsFromJson(e.toString()))
      .toList();
}

List<enums.UserEntityPermissions>? userEntityPermissionsNullableListFromJson(
  List? userEntityPermissions, [
  List<enums.UserEntityPermissions>? defaultValue,
]) {
  if (userEntityPermissions == null) {
    return defaultValue;
  }

  return userEntityPermissions
      .map((e) => userEntityPermissionsFromJson(e.toString()))
      .toList();
}

String? setPermissionsDtoToJson(enums.SetPermissionsDto? setPermissionsDto) {
  return setPermissionsDto?.value;
}

enums.SetPermissionsDto setPermissionsDtoFromJson(
  Object? setPermissionsDto, [
  enums.SetPermissionsDto? defaultValue,
]) {
  return enums.SetPermissionsDto.values
          .firstWhereOrNull((e) => e.value == setPermissionsDto) ??
      defaultValue ??
      enums.SetPermissionsDto.swaggerGeneratedUnknown;
}

List<String> setPermissionsDtoListToJson(
    List<enums.SetPermissionsDto>? setPermissionsDto) {
  if (setPermissionsDto == null) {
    return [];
  }

  return setPermissionsDto.map((e) => e.value!).toList();
}

List<enums.SetPermissionsDto> setPermissionsDtoListFromJson(
  List? setPermissionsDto, [
  List<enums.SetPermissionsDto>? defaultValue,
]) {
  if (setPermissionsDto == null) {
    return defaultValue ?? [];
  }

  return setPermissionsDto
      .map((e) => setPermissionsDtoFromJson(e.toString()))
      .toList();
}

List<enums.SetPermissionsDto>? setPermissionsDtoNullableListFromJson(
  List? setPermissionsDto, [
  List<enums.SetPermissionsDto>? defaultValue,
]) {
  if (setPermissionsDto == null) {
    return defaultValue;
  }

  return setPermissionsDto
      .map((e) => setPermissionsDtoFromJson(e.toString()))
      .toList();
}

String? bookEntityStateToJson(enums.BookEntityState? bookEntityState) {
  return bookEntityState?.value;
}

enums.BookEntityState bookEntityStateFromJson(
  Object? bookEntityState, [
  enums.BookEntityState? defaultValue,
]) {
  return enums.BookEntityState.values
          .firstWhereOrNull((e) => e.value == bookEntityState) ??
      defaultValue ??
      enums.BookEntityState.swaggerGeneratedUnknown;
}

List<String> bookEntityStateListToJson(
    List<enums.BookEntityState>? bookEntityState) {
  if (bookEntityState == null) {
    return [];
  }

  return bookEntityState.map((e) => e.value!).toList();
}

List<enums.BookEntityState> bookEntityStateListFromJson(
  List? bookEntityState, [
  List<enums.BookEntityState>? defaultValue,
]) {
  if (bookEntityState == null) {
    return defaultValue ?? [];
  }

  return bookEntityState
      .map((e) => bookEntityStateFromJson(e.toString()))
      .toList();
}

List<enums.BookEntityState>? bookEntityStateNullableListFromJson(
  List? bookEntityState, [
  List<enums.BookEntityState>? defaultValue,
]) {
  if (bookEntityState == null) {
    return defaultValue;
  }

  return bookEntityState
      .map((e) => bookEntityStateFromJson(e.toString()))
      .toList();
}

String? bookEntity$Tags$ItemTypeToJson(
    enums.BookEntity$Tags$ItemType? bookEntity$Tags$ItemType) {
  return bookEntity$Tags$ItemType?.value;
}

enums.BookEntity$Tags$ItemType bookEntity$Tags$ItemTypeFromJson(
  Object? bookEntity$Tags$ItemType, [
  enums.BookEntity$Tags$ItemType? defaultValue,
]) {
  return enums.BookEntity$Tags$ItemType.values
          .firstWhereOrNull((e) => e.value == bookEntity$Tags$ItemType) ??
      defaultValue ??
      enums.BookEntity$Tags$ItemType.swaggerGeneratedUnknown;
}

List<String> bookEntity$Tags$ItemTypeListToJson(
    List<enums.BookEntity$Tags$ItemType>? bookEntity$Tags$ItemType) {
  if (bookEntity$Tags$ItemType == null) {
    return [];
  }

  return bookEntity$Tags$ItemType.map((e) => e.value!).toList();
}

List<enums.BookEntity$Tags$ItemType> bookEntity$Tags$ItemTypeListFromJson(
  List? bookEntity$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (bookEntity$Tags$ItemType == null) {
    return defaultValue ?? [];
  }

  return bookEntity$Tags$ItemType
      .map((e) => bookEntity$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

List<enums.BookEntity$Tags$ItemType>?
    bookEntity$Tags$ItemTypeNullableListFromJson(
  List? bookEntity$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (bookEntity$Tags$ItemType == null) {
    return defaultValue;
  }

  return bookEntity$Tags$ItemType
      .map((e) => bookEntity$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

String? createBookDto$Tags$ItemTypeToJson(
    enums.BookEntity$Tags$ItemType? createBookDto$Tags$ItemType) {
  return createBookDto$Tags$ItemType?.value;
}

enums.BookEntity$Tags$ItemType createBookDto$Tags$ItemTypeFromJson(
  Object? createBookDto$Tags$ItemType, [
  enums.BookEntity$Tags$ItemType? defaultValue,
]) {
  return enums.BookEntity$Tags$ItemType.values
          .firstWhereOrNull((e) => e.value == createBookDto$Tags$ItemType) ??
      defaultValue ??
      enums.BookEntity$Tags$ItemType.swaggerGeneratedUnknown;
}

List<String> createBookDto$Tags$ItemTypeListToJson(
    List<enums.BookEntity$Tags$ItemType>? createBookDto$Tags$ItemType) {
  if (createBookDto$Tags$ItemType == null) {
    return [];
  }

  return createBookDto$Tags$ItemType.map((e) => e.value!).toList();
}

List<enums.BookEntity$Tags$ItemType> createBookDto$Tags$ItemTypeListFromJson(
  List? createBookDto$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (createBookDto$Tags$ItemType == null) {
    return defaultValue ?? [];
  }

  return createBookDto$Tags$ItemType
      .map((e) => createBookDto$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

List<enums.BookEntity$Tags$ItemType>?
    createBookDto$Tags$ItemTypeNullableListFromJson(
  List? createBookDto$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (createBookDto$Tags$ItemType == null) {
    return defaultValue;
  }

  return createBookDto$Tags$ItemType
      .map((e) => createBookDto$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

String? updateBookDto$Tags$ItemTypeToJson(
    enums.BookEntity$Tags$ItemType? updateBookDto$Tags$ItemType) {
  return updateBookDto$Tags$ItemType?.value;
}

enums.BookEntity$Tags$ItemType updateBookDto$Tags$ItemTypeFromJson(
  Object? updateBookDto$Tags$ItemType, [
  enums.BookEntity$Tags$ItemType? defaultValue,
]) {
  return enums.BookEntity$Tags$ItemType.values
          .firstWhereOrNull((e) => e.value == updateBookDto$Tags$ItemType) ??
      defaultValue ??
      enums.BookEntity$Tags$ItemType.swaggerGeneratedUnknown;
}

List<String> updateBookDto$Tags$ItemTypeListToJson(
    List<enums.BookEntity$Tags$ItemType>? updateBookDto$Tags$ItemType) {
  if (updateBookDto$Tags$ItemType == null) {
    return [];
  }

  return updateBookDto$Tags$ItemType.map((e) => e.value!).toList();
}

List<enums.BookEntity$Tags$ItemType> updateBookDto$Tags$ItemTypeListFromJson(
  List? updateBookDto$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (updateBookDto$Tags$ItemType == null) {
    return defaultValue ?? [];
  }

  return updateBookDto$Tags$ItemType
      .map((e) => updateBookDto$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

List<enums.BookEntity$Tags$ItemType>?
    updateBookDto$Tags$ItemTypeNullableListFromJson(
  List? updateBookDto$Tags$ItemType, [
  List<enums.BookEntity$Tags$ItemType>? defaultValue,
]) {
  if (updateBookDto$Tags$ItemType == null) {
    return defaultValue;
  }

  return updateBookDto$Tags$ItemType
      .map((e) => updateBookDto$Tags$ItemTypeFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
