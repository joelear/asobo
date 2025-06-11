// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoundParticipantStruct extends BaseStruct {
  RoundParticipantStruct({
    String? userId,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? profileImageBlurHash,
    RoundParticipantStatus? status,
    RoundParticipantRole? role,
  })  : _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _profileImageUrl = profileImageUrl,
        _profileImageBlurHash = profileImageBlurHash,
        _status = status,
        _role = role;

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

  // "profile_image_url" field.
  String? _profileImageUrl;
  String get profileImageUrl => _profileImageUrl ?? '';
  set profileImageUrl(String? val) => _profileImageUrl = val;

  bool hasProfileImageUrl() => _profileImageUrl != null;

  // "profile_image_blur_hash" field.
  String? _profileImageBlurHash;
  String get profileImageBlurHash => _profileImageBlurHash ?? '';
  set profileImageBlurHash(String? val) => _profileImageBlurHash = val;

  bool hasProfileImageBlurHash() => _profileImageBlurHash != null;

  // "status" field.
  RoundParticipantStatus? _status;
  RoundParticipantStatus? get status => _status;
  set status(RoundParticipantStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "role" field.
  RoundParticipantRole? _role;
  RoundParticipantRole? get role => _role;
  set role(RoundParticipantRole? val) => _role = val;

  bool hasRole() => _role != null;

  static RoundParticipantStruct fromMap(Map<String, dynamic> data) =>
      RoundParticipantStruct(
        userId: data['user_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        profileImageUrl: data['profile_image_url'] as String?,
        profileImageBlurHash: data['profile_image_blur_hash'] as String?,
        status: data['status'] is RoundParticipantStatus
            ? data['status']
            : deserializeEnum<RoundParticipantStatus>(data['status']),
        role: data['role'] is RoundParticipantRole
            ? data['role']
            : deserializeEnum<RoundParticipantRole>(data['role']),
      );

  static RoundParticipantStruct? maybeFromMap(dynamic data) => data is Map
      ? RoundParticipantStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'first_name': _firstName,
        'last_name': _lastName,
        'profile_image_url': _profileImageUrl,
        'profile_image_blur_hash': _profileImageBlurHash,
        'status': _status?.serialize(),
        'role': _role?.serialize(),
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
        'profile_image_url': serializeParam(
          _profileImageUrl,
          ParamType.String,
        ),
        'profile_image_blur_hash': serializeParam(
          _profileImageBlurHash,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static RoundParticipantStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RoundParticipantStruct(
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
        profileImageUrl: deserializeParam(
          data['profile_image_url'],
          ParamType.String,
          false,
        ),
        profileImageBlurHash: deserializeParam(
          data['profile_image_blur_hash'],
          ParamType.String,
          false,
        ),
        status: deserializeParam<RoundParticipantStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        role: deserializeParam<RoundParticipantRole>(
          data['role'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'RoundParticipantStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoundParticipantStruct &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        profileImageUrl == other.profileImageUrl &&
        profileImageBlurHash == other.profileImageBlurHash &&
        status == other.status &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        firstName,
        lastName,
        profileImageUrl,
        profileImageBlurHash,
        status,
        role
      ]);
}

RoundParticipantStruct createRoundParticipantStruct({
  String? userId,
  String? firstName,
  String? lastName,
  String? profileImageUrl,
  String? profileImageBlurHash,
  RoundParticipantStatus? status,
  RoundParticipantRole? role,
}) =>
    RoundParticipantStruct(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      profileImageUrl: profileImageUrl,
      profileImageBlurHash: profileImageBlurHash,
      status: status,
      role: role,
    );
