// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectionInfoStruct extends BaseStruct {
  ConnectionInfoStruct({
    String? senderUserId,
    String? recipientUserId,
    ConnectionStatus? status,
    bool? connectionExists,
    String? connectionId,
  })  : _senderUserId = senderUserId,
        _recipientUserId = recipientUserId,
        _status = status,
        _connectionExists = connectionExists,
        _connectionId = connectionId;

  // "sender_user_id" field.
  String? _senderUserId;
  String get senderUserId => _senderUserId ?? '';
  set senderUserId(String? val) => _senderUserId = val;

  bool hasSenderUserId() => _senderUserId != null;

  // "recipient_user_id" field.
  String? _recipientUserId;
  String get recipientUserId => _recipientUserId ?? '';
  set recipientUserId(String? val) => _recipientUserId = val;

  bool hasRecipientUserId() => _recipientUserId != null;

  // "status" field.
  ConnectionStatus? _status;
  ConnectionStatus? get status => _status;
  set status(ConnectionStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "connection_exists" field.
  bool? _connectionExists;
  bool get connectionExists => _connectionExists ?? false;
  set connectionExists(bool? val) => _connectionExists = val;

  bool hasConnectionExists() => _connectionExists != null;

  // "connection_id" field.
  String? _connectionId;
  String get connectionId => _connectionId ?? '';
  set connectionId(String? val) => _connectionId = val;

  bool hasConnectionId() => _connectionId != null;

  static ConnectionInfoStruct fromMap(Map<String, dynamic> data) =>
      ConnectionInfoStruct(
        senderUserId: data['sender_user_id'] as String?,
        recipientUserId: data['recipient_user_id'] as String?,
        status: data['status'] is ConnectionStatus
            ? data['status']
            : deserializeEnum<ConnectionStatus>(data['status']),
        connectionExists: data['connection_exists'] as bool?,
        connectionId: data['connection_id'] as String?,
      );

  static ConnectionInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ConnectionInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sender_user_id': _senderUserId,
        'recipient_user_id': _recipientUserId,
        'status': _status?.serialize(),
        'connection_exists': _connectionExists,
        'connection_id': _connectionId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sender_user_id': serializeParam(
          _senderUserId,
          ParamType.String,
        ),
        'recipient_user_id': serializeParam(
          _recipientUserId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'connection_exists': serializeParam(
          _connectionExists,
          ParamType.bool,
        ),
        'connection_id': serializeParam(
          _connectionId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConnectionInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConnectionInfoStruct(
        senderUserId: deserializeParam(
          data['sender_user_id'],
          ParamType.String,
          false,
        ),
        recipientUserId: deserializeParam(
          data['recipient_user_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam<ConnectionStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        connectionExists: deserializeParam(
          data['connection_exists'],
          ParamType.bool,
          false,
        ),
        connectionId: deserializeParam(
          data['connection_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConnectionInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConnectionInfoStruct &&
        senderUserId == other.senderUserId &&
        recipientUserId == other.recipientUserId &&
        status == other.status &&
        connectionExists == other.connectionExists &&
        connectionId == other.connectionId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [senderUserId, recipientUserId, status, connectionExists, connectionId]);
}

ConnectionInfoStruct createConnectionInfoStruct({
  String? senderUserId,
  String? recipientUserId,
  ConnectionStatus? status,
  bool? connectionExists,
  String? connectionId,
}) =>
    ConnectionInfoStruct(
      senderUserId: senderUserId,
      recipientUserId: recipientUserId,
      status: status,
      connectionExists: connectionExists,
      connectionId: connectionId,
    );
