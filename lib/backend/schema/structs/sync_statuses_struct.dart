// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SyncStatusesStruct extends BaseStruct {
  SyncStatusesStruct({
    DateTime? chatsLastSynced,
    DateTime? usersLastSynced,
    DateTime? messagesLastSynced,
    DateTime? chatParticipantsLastSynced,
  })  : _chatsLastSynced = chatsLastSynced,
        _usersLastSynced = usersLastSynced,
        _messagesLastSynced = messagesLastSynced,
        _chatParticipantsLastSynced = chatParticipantsLastSynced;

  // "chats_last_synced" field.
  DateTime? _chatsLastSynced;
  DateTime get chatsLastSynced =>
      _chatsLastSynced ?? DateTime.fromMicrosecondsSinceEpoch(1735689600000000);
  set chatsLastSynced(DateTime? val) => _chatsLastSynced = val;

  bool hasChatsLastSynced() => _chatsLastSynced != null;

  // "users_last_synced" field.
  DateTime? _usersLastSynced;
  DateTime get usersLastSynced =>
      _usersLastSynced ?? DateTime.fromMicrosecondsSinceEpoch(1735689600000000);
  set usersLastSynced(DateTime? val) => _usersLastSynced = val;

  bool hasUsersLastSynced() => _usersLastSynced != null;

  // "messages_last_synced" field.
  DateTime? _messagesLastSynced;
  DateTime get messagesLastSynced =>
      _messagesLastSynced ??
      DateTime.fromMicrosecondsSinceEpoch(1735689600000000);
  set messagesLastSynced(DateTime? val) => _messagesLastSynced = val;

  bool hasMessagesLastSynced() => _messagesLastSynced != null;

  // "chat_participants_last_synced" field.
  DateTime? _chatParticipantsLastSynced;
  DateTime get chatParticipantsLastSynced =>
      _chatParticipantsLastSynced ??
      DateTime.fromMicrosecondsSinceEpoch(1735689600000000);
  set chatParticipantsLastSynced(DateTime? val) =>
      _chatParticipantsLastSynced = val;

  bool hasChatParticipantsLastSynced() => _chatParticipantsLastSynced != null;

  static SyncStatusesStruct fromMap(Map<String, dynamic> data) =>
      SyncStatusesStruct(
        chatsLastSynced: data['chats_last_synced'] as DateTime?,
        usersLastSynced: data['users_last_synced'] as DateTime?,
        messagesLastSynced: data['messages_last_synced'] as DateTime?,
        chatParticipantsLastSynced:
            data['chat_participants_last_synced'] as DateTime?,
      );

  static SyncStatusesStruct? maybeFromMap(dynamic data) => data is Map
      ? SyncStatusesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chats_last_synced': _chatsLastSynced,
        'users_last_synced': _usersLastSynced,
        'messages_last_synced': _messagesLastSynced,
        'chat_participants_last_synced': _chatParticipantsLastSynced,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chats_last_synced': serializeParam(
          _chatsLastSynced,
          ParamType.DateTime,
        ),
        'users_last_synced': serializeParam(
          _usersLastSynced,
          ParamType.DateTime,
        ),
        'messages_last_synced': serializeParam(
          _messagesLastSynced,
          ParamType.DateTime,
        ),
        'chat_participants_last_synced': serializeParam(
          _chatParticipantsLastSynced,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SyncStatusesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SyncStatusesStruct(
        chatsLastSynced: deserializeParam(
          data['chats_last_synced'],
          ParamType.DateTime,
          false,
        ),
        usersLastSynced: deserializeParam(
          data['users_last_synced'],
          ParamType.DateTime,
          false,
        ),
        messagesLastSynced: deserializeParam(
          data['messages_last_synced'],
          ParamType.DateTime,
          false,
        ),
        chatParticipantsLastSynced: deserializeParam(
          data['chat_participants_last_synced'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SyncStatusesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SyncStatusesStruct &&
        chatsLastSynced == other.chatsLastSynced &&
        usersLastSynced == other.usersLastSynced &&
        messagesLastSynced == other.messagesLastSynced &&
        chatParticipantsLastSynced == other.chatParticipantsLastSynced;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatsLastSynced,
        usersLastSynced,
        messagesLastSynced,
        chatParticipantsLastSynced
      ]);
}

SyncStatusesStruct createSyncStatusesStruct({
  DateTime? chatsLastSynced,
  DateTime? usersLastSynced,
  DateTime? messagesLastSynced,
  DateTime? chatParticipantsLastSynced,
}) =>
    SyncStatusesStruct(
      chatsLastSynced: chatsLastSynced,
      usersLastSynced: usersLastSynced,
      messagesLastSynced: messagesLastSynced,
      chatParticipantsLastSynced: chatParticipantsLastSynced,
    );
