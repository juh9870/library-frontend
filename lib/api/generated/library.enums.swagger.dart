import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum UserEntityPermissions {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ADMIN')
  admin('ADMIN'),
  @JsonValue('APPROVE')
  approve('APPROVE'),
  @JsonValue('CREATE')
  create('CREATE'),
  @JsonValue('ARCHIVE')
  archive('ARCHIVE'),
  @JsonValue('EDIT')
  edit('EDIT'),
  @JsonValue('DELETE')
  delete('DELETE');

  final String? value;

  const UserEntityPermissions(this.value);
}

enum SetPermissionsDto {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ADMIN')
  admin('ADMIN'),
  @JsonValue('APPROVE')
  approve('APPROVE'),
  @JsonValue('CREATE')
  create('CREATE'),
  @JsonValue('ARCHIVE')
  archive('ARCHIVE'),
  @JsonValue('EDIT')
  edit('EDIT'),
  @JsonValue('DELETE')
  delete('DELETE');

  final String? value;

  const SetPermissionsDto(this.value);
}

enum BookEntityState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DRAFT')
  draft('DRAFT'),
  @JsonValue('UNAPPROVED')
  unapproved('UNAPPROVED'),
  @JsonValue('VISIBLE')
  visible('VISIBLE'),
  @JsonValue('ARCHIVED')
  archived('ARCHIVED');

  final String? value;

  const BookEntityState(this.value);
}

enum BookEntity$Tags$ItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('GENRE')
  genre('GENRE'),
  @JsonValue('AUTHOR')
  author('AUTHOR'),
  @JsonValue('MISC')
  misc('MISC');

  final String? value;

  const BookEntity$Tags$ItemType(this.value);
}