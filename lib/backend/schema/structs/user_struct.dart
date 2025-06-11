// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? userId,
    String? firstName,
    String? lastName,
    String? profileImageBlurHash,
    String? profileImageUrl,
  })  : _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _profileImageBlurHash = profileImageBlurHash,
        _profileImageUrl = profileImageUrl;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "profile_image_blur_hash" field.
  String? _profileImageBlurHash;
  String get profileImageBlurHash => _profileImageBlurHash ?? '';
  set profileImageBlurHash(String? val) => _profileImageBlurHash = val;

  bool hasProfileImageBlurHash() => _profileImageBlurHash != null;

  // "profile_image_url" field.
  String? _profileImageUrl;
  String get profileImageUrl => _profileImageUrl ?? '';
  set profileImageUrl(String? val) => _profileImageUrl = val;

  bool hasProfileImageUrl() => _profileImageUrl != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        userId: data['user_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        profileImageBlurHash: data['profile_image_blur_hash'] as String?,
        profileImageUrl: data['profile_image_url'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'first_name': _firstName,
        'last_name': _lastName,
        'profile_image_blur_hash': _profileImageBlurHash,
        'profile_image_url': _profileImageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'profile_image_blur_hash': serializeParam(
          _profileImageBlurHash,
          ParamType.String,
        ),
        'profile_image_url': serializeParam(
          _profileImageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        profileImageBlurHash: deserializeParam(
          data['profile_image_blur_hash'],
          ParamType.String,
          false,
        ),
        profileImageUrl: deserializeParam(
          data['profile_image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        profileImageBlurHash == other.profileImageBlurHash &&
        profileImageUrl == other.profileImageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [userId, firstName, lastName, profileImageBlurHash, profileImageUrl]);
}

UserStruct createUserStruct({
  String? userId,
  String? firstName,
  String? lastName,
  String? profileImageBlurHash,
  String? profileImageUrl,
}) =>
    UserStruct(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      profileImageBlurHash: profileImageBlurHash,
      profileImageUrl: profileImageUrl,
    );
