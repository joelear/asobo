// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserConnectionStruct extends BaseStruct {
  UserConnectionStruct({
    String? userId,
    String? firstName,
    String? lastName,
    String? profileImageBlurHash,
    String? profileImageUrl,
    ConnectionStatus? status,
    double? handicap,
    int? mutualConnectionCount,
    String? location,
    String? mutualConnectionFirstName,
    String? mutualConnectionLastName,
  })  : _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _profileImageBlurHash = profileImageBlurHash,
        _profileImageUrl = profileImageUrl,
        _status = status,
        _handicap = handicap,
        _mutualConnectionCount = mutualConnectionCount,
        _location = location,
        _mutualConnectionFirstName = mutualConnectionFirstName,
        _mutualConnectionLastName = mutualConnectionLastName;

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

  // "status" field.
  ConnectionStatus? _status;
  ConnectionStatus? get status => _status;
  set status(ConnectionStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "handicap" field.
  double? _handicap;
  double get handicap => _handicap ?? 0.0;
  set handicap(double? val) => _handicap = val;

  void incrementHandicap(double amount) => handicap = handicap + amount;

  bool hasHandicap() => _handicap != null;

  // "mutual_connection_count" field.
  int? _mutualConnectionCount;
  int get mutualConnectionCount => _mutualConnectionCount ?? 0;
  set mutualConnectionCount(int? val) => _mutualConnectionCount = val;

  void incrementMutualConnectionCount(int amount) =>
      mutualConnectionCount = mutualConnectionCount + amount;

  bool hasMutualConnectionCount() => _mutualConnectionCount != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "mutual_connection_first_name" field.
  String? _mutualConnectionFirstName;
  String get mutualConnectionFirstName => _mutualConnectionFirstName ?? '';
  set mutualConnectionFirstName(String? val) =>
      _mutualConnectionFirstName = val;

  bool hasMutualConnectionFirstName() => _mutualConnectionFirstName != null;

  // "mutual_connection_last_name" field.
  String? _mutualConnectionLastName;
  String get mutualConnectionLastName => _mutualConnectionLastName ?? '';
  set mutualConnectionLastName(String? val) => _mutualConnectionLastName = val;

  bool hasMutualConnectionLastName() => _mutualConnectionLastName != null;

  static UserConnectionStruct fromMap(Map<String, dynamic> data) =>
      UserConnectionStruct(
        userId: data['user_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        profileImageBlurHash: data['profile_image_blur_hash'] as String?,
        profileImageUrl: data['profile_image_url'] as String?,
        status: data['status'] is ConnectionStatus
            ? data['status']
            : deserializeEnum<ConnectionStatus>(data['status']),
        handicap: castToType<double>(data['handicap']),
        mutualConnectionCount: castToType<int>(data['mutual_connection_count']),
        location: data['location'] as String?,
        mutualConnectionFirstName:
            data['mutual_connection_first_name'] as String?,
        mutualConnectionLastName:
            data['mutual_connection_last_name'] as String?,
      );

  static UserConnectionStruct? maybeFromMap(dynamic data) => data is Map
      ? UserConnectionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'first_name': _firstName,
        'last_name': _lastName,
        'profile_image_blur_hash': _profileImageBlurHash,
        'profile_image_url': _profileImageUrl,
        'status': _status?.serialize(),
        'handicap': _handicap,
        'mutual_connection_count': _mutualConnectionCount,
        'location': _location,
        'mutual_connection_first_name': _mutualConnectionFirstName,
        'mutual_connection_last_name': _mutualConnectionLastName,
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
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'handicap': serializeParam(
          _handicap,
          ParamType.double,
        ),
        'mutual_connection_count': serializeParam(
          _mutualConnectionCount,
          ParamType.int,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'mutual_connection_first_name': serializeParam(
          _mutualConnectionFirstName,
          ParamType.String,
        ),
        'mutual_connection_last_name': serializeParam(
          _mutualConnectionLastName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserConnectionStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserConnectionStruct(
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
        status: deserializeParam<ConnectionStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        handicap: deserializeParam(
          data['handicap'],
          ParamType.double,
          false,
        ),
        mutualConnectionCount: deserializeParam(
          data['mutual_connection_count'],
          ParamType.int,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        mutualConnectionFirstName: deserializeParam(
          data['mutual_connection_first_name'],
          ParamType.String,
          false,
        ),
        mutualConnectionLastName: deserializeParam(
          data['mutual_connection_last_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserConnectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserConnectionStruct &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        profileImageBlurHash == other.profileImageBlurHash &&
        profileImageUrl == other.profileImageUrl &&
        status == other.status &&
        handicap == other.handicap &&
        mutualConnectionCount == other.mutualConnectionCount &&
        location == other.location &&
        mutualConnectionFirstName == other.mutualConnectionFirstName &&
        mutualConnectionLastName == other.mutualConnectionLastName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        firstName,
        lastName,
        profileImageBlurHash,
        profileImageUrl,
        status,
        handicap,
        mutualConnectionCount,
        location,
        mutualConnectionFirstName,
        mutualConnectionLastName
      ]);
}

UserConnectionStruct createUserConnectionStruct({
  String? userId,
  String? firstName,
  String? lastName,
  String? profileImageBlurHash,
  String? profileImageUrl,
  ConnectionStatus? status,
  double? handicap,
  int? mutualConnectionCount,
  String? location,
  String? mutualConnectionFirstName,
  String? mutualConnectionLastName,
}) =>
    UserConnectionStruct(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      profileImageBlurHash: profileImageBlurHash,
      profileImageUrl: profileImageUrl,
      status: status,
      handicap: handicap,
      mutualConnectionCount: mutualConnectionCount,
      location: location,
      mutualConnectionFirstName: mutualConnectionFirstName,
      mutualConnectionLastName: mutualConnectionLastName,
    );
