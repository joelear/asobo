// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatParticipantStruct extends BaseStruct {
  ChatParticipantStruct({
    String? participantId,
    String? chatId,
    String? userId,
    String? participantRole,
  })  : _participantId = participantId,
        _chatId = chatId,
        _userId = userId,
        _participantRole = participantRole;

  // "participant_id" field.
  String? _participantId;
  String get participantId => _participantId ?? '';
  set participantId(String? val) => _participantId = val;

  bool hasParticipantId() => _participantId != null;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "participant_role" field.
  String? _participantRole;
  String get participantRole => _participantRole ?? '';
  set participantRole(String? val) => _participantRole = val;

  bool hasParticipantRole() => _participantRole != null;

  static ChatParticipantStruct fromMap(Map<String, dynamic> data) =>
      ChatParticipantStruct(
        participantId: data['participant_id'] as String?,
        chatId: data['chat_id'] as String?,
        userId: data['user_id'] as String?,
        participantRole: data['participant_role'] as String?,
      );

  static ChatParticipantStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatParticipantStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'participant_id': _participantId,
        'chat_id': _chatId,
        'user_id': _userId,
        'participant_role': _participantRole,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'participant_id': serializeParam(
          _participantId,
          ParamType.String,
        ),
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'participant_role': serializeParam(
          _participantRole,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatParticipantStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatParticipantStruct(
        participantId: deserializeParam(
          data['participant_id'],
          ParamType.String,
          false,
        ),
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        participantRole: deserializeParam(
          data['participant_role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatParticipantStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatParticipantStruct &&
        participantId == other.participantId &&
        chatId == other.chatId &&
        userId == other.userId &&
        participantRole == other.participantRole;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([participantId, chatId, userId, participantRole]);
}

ChatParticipantStruct createChatParticipantStruct({
  String? participantId,
  String? chatId,
  String? userId,
  String? participantRole,
}) =>
    ChatParticipantStruct(
      participantId: participantId,
      chatId: chatId,
      userId: userId,
      participantRole: participantRole,
    );
