// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MutualConnectionStruct extends BaseStruct {
  MutualConnectionStruct({
    String? mutualConnetionId,
    String? mutualConnectionFirstName,
    String? mutualConnectionLastName,
    String? mutualConnectionProfileImageUrl,
    String? mutualConnectionProfileImageBlurHash,
  })  : _mutualConnetionId = mutualConnetionId,
        _mutualConnectionFirstName = mutualConnectionFirstName,
        _mutualConnectionLastName = mutualConnectionLastName,
        _mutualConnectionProfileImageUrl = mutualConnectionProfileImageUrl,
        _mutualConnectionProfileImageBlurHash =
            mutualConnectionProfileImageBlurHash;

  // "mutual_connetion_id" field.
  String? _mutualConnetionId;
  String get mutualConnetionId => _mutualConnetionId ?? '';
  set mutualConnetionId(String? val) => _mutualConnetionId = val;

  bool hasMutualConnetionId() => _mutualConnetionId != null;

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

  // "mutual_connection_profile_image_url" field.
  String? _mutualConnectionProfileImageUrl;
  String get mutualConnectionProfileImageUrl =>
      _mutualConnectionProfileImageUrl ?? '';
  set mutualConnectionProfileImageUrl(String? val) =>
      _mutualConnectionProfileImageUrl = val;

  bool hasMutualConnectionProfileImageUrl() =>
      _mutualConnectionProfileImageUrl != null;

  // "mutual_connection_profile_image_blur_hash" field.
  String? _mutualConnectionProfileImageBlurHash;
  String get mutualConnectionProfileImageBlurHash =>
      _mutualConnectionProfileImageBlurHash ?? '';
  set mutualConnectionProfileImageBlurHash(String? val) =>
      _mutualConnectionProfileImageBlurHash = val;

  bool hasMutualConnectionProfileImageBlurHash() =>
      _mutualConnectionProfileImageBlurHash != null;

  static MutualConnectionStruct fromMap(Map<String, dynamic> data) =>
      MutualConnectionStruct(
        mutualConnetionId: data['mutual_connetion_id'] as String?,
        mutualConnectionFirstName:
            data['mutual_connection_first_name'] as String?,
        mutualConnectionLastName:
            data['mutual_connection_last_name'] as String?,
        mutualConnectionProfileImageUrl:
            data['mutual_connection_profile_image_url'] as String?,
        mutualConnectionProfileImageBlurHash:
            data['mutual_connection_profile_image_blur_hash'] as String?,
      );

  static MutualConnectionStruct? maybeFromMap(dynamic data) => data is Map
      ? MutualConnectionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mutual_connetion_id': _mutualConnetionId,
        'mutual_connection_first_name': _mutualConnectionFirstName,
        'mutual_connection_last_name': _mutualConnectionLastName,
        'mutual_connection_profile_image_url': _mutualConnectionProfileImageUrl,
        'mutual_connection_profile_image_blur_hash':
            _mutualConnectionProfileImageBlurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mutual_connetion_id': serializeParam(
          _mutualConnetionId,
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
        'mutual_connection_profile_image_url': serializeParam(
          _mutualConnectionProfileImageUrl,
          ParamType.String,
        ),
        'mutual_connection_profile_image_blur_hash': serializeParam(
          _mutualConnectionProfileImageBlurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static MutualConnectionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MutualConnectionStruct(
        mutualConnetionId: deserializeParam(
          data['mutual_connetion_id'],
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
        mutualConnectionProfileImageUrl: deserializeParam(
          data['mutual_connection_profile_image_url'],
          ParamType.String,
          false,
        ),
        mutualConnectionProfileImageBlurHash: deserializeParam(
          data['mutual_connection_profile_image_blur_hash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MutualConnectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MutualConnectionStruct &&
        mutualConnetionId == other.mutualConnetionId &&
        mutualConnectionFirstName == other.mutualConnectionFirstName &&
        mutualConnectionLastName == other.mutualConnectionLastName &&
        mutualConnectionProfileImageUrl ==
            other.mutualConnectionProfileImageUrl &&
        mutualConnectionProfileImageBlurHash ==
            other.mutualConnectionProfileImageBlurHash;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mutualConnetionId,
        mutualConnectionFirstName,
        mutualConnectionLastName,
        mutualConnectionProfileImageUrl,
        mutualConnectionProfileImageBlurHash
      ]);
}

MutualConnectionStruct createMutualConnectionStruct({
  String? mutualConnetionId,
  String? mutualConnectionFirstName,
  String? mutualConnectionLastName,
  String? mutualConnectionProfileImageUrl,
  String? mutualConnectionProfileImageBlurHash,
}) =>
    MutualConnectionStruct(
      mutualConnetionId: mutualConnetionId,
      mutualConnectionFirstName: mutualConnectionFirstName,
      mutualConnectionLastName: mutualConnectionLastName,
      mutualConnectionProfileImageUrl: mutualConnectionProfileImageUrl,
      mutualConnectionProfileImageBlurHash:
          mutualConnectionProfileImageBlurHash,
    );
