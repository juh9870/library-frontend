// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

RefreshTokenDto _$RefreshTokenDtoFromJson(Map<String, dynamic> json) =>
    RefreshTokenDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenDtoToJson(RefreshTokenDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

AuthTokenDto _$AuthTokenDtoFromJson(Map<String, dynamic> json) => AuthTokenDto(
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$AuthTokenDtoToJson(AuthTokenDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => RegisterDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterDtoToJson(RegisterDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      permissions:
          userEntityPermissionsListFromJson(json['permissions'] as List?),
      id: json['id'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      lastTokenReset: json['lastTokenReset'] == null
          ? null
          : DateTime.parse(json['lastTokenReset'] as String),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'permissions': userEntityPermissionsListToJson(instance.permissions),
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'username': instance.username,
      'passwordHash': instance.passwordHash,
      'lastTokenReset': instance.lastTokenReset?.toIso8601String(),
    };

BookEntity _$BookEntityFromJson(Map<String, dynamic> json) => BookEntity(
      state: bookEntityStateFromJson(json['state']),
      id: json['id'] as String,
      title: json['title'] as String,
      imageFile: json['imageFile'] as String?,
      bookFile: json['bookFile'] as String?,
      description: json['description'] as String,
      publishedDate: json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      userId: json['userId'] as String?,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) =>
                  BookEntity$Tags$Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BookEntityToJson(BookEntity instance) =>
    <String, dynamic>{
      'state': bookEntityStateToJson(instance.state),
      'id': instance.id,
      'title': instance.title,
      'imageFile': instance.imageFile,
      'bookFile': instance.bookFile,
      'description': instance.description,
      'published_date': instance.publishedDate?.toIso8601String(),
      'userId': instance.userId,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

CreateBookDto _$CreateBookDtoFromJson(Map<String, dynamic> json) =>
    CreateBookDto(
      title: json['title'] as String,
      description: json['description'] as String,
      publishedDate: json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) =>
                  CreateBookDto$Tags$Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateBookDtoToJson(CreateBookDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'published_date': instance.publishedDate?.toIso8601String(),
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

UpdateBookDto _$UpdateBookDtoFromJson(Map<String, dynamic> json) =>
    UpdateBookDto(
      title: json['title'] as String?,
      description: json['description'] as String?,
      publishedDate: json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) =>
                  UpdateBookDto$Tags$Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UpdateBookDtoToJson(UpdateBookDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'published_date': instance.publishedDate?.toIso8601String(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
    };

FileUploadDto _$FileUploadDtoFromJson(Map<String, dynamic> json) =>
    FileUploadDto(
      file: json['file'] as String,
    );

Map<String, dynamic> _$FileUploadDtoToJson(FileUploadDto instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

BookEntity$Tags$Item _$BookEntity$Tags$ItemFromJson(
        Map<String, dynamic> json) =>
    BookEntity$Tags$Item(
      type: bookEntity$Tags$ItemTypeFromJson(json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BookEntity$Tags$ItemToJson(
        BookEntity$Tags$Item instance) =>
    <String, dynamic>{
      'type': bookEntity$Tags$ItemTypeToJson(instance.type),
      'name': instance.name,
    };

CreateBookDto$Tags$Item _$CreateBookDto$Tags$ItemFromJson(
        Map<String, dynamic> json) =>
    CreateBookDto$Tags$Item(
      type: createBookDto$Tags$ItemTypeFromJson(json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateBookDto$Tags$ItemToJson(
        CreateBookDto$Tags$Item instance) =>
    <String, dynamic>{
      'type': createBookDto$Tags$ItemTypeToJson(instance.type),
      'name': instance.name,
    };

UpdateBookDto$Tags$Item _$UpdateBookDto$Tags$ItemFromJson(
        Map<String, dynamic> json) =>
    UpdateBookDto$Tags$Item(
      type: updateBookDto$Tags$ItemTypeFromJson(json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UpdateBookDto$Tags$ItemToJson(
        UpdateBookDto$Tags$Item instance) =>
    <String, dynamic>{
      'type': updateBookDto$Tags$ItemTypeToJson(instance.type),
      'name': instance.name,
    };
