// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends BaseStruct {
  MessageStruct({
    String? messageId,
    String? chatId,
    String? senderId,
    String? messageText,
    int? createdAtUnixMilli,
    String? senderFirstName,
  })  : _messageId = messageId,
        _chatId = chatId,
        _senderId = senderId,
        _messageText = messageText,
        _createdAtUnixMilli = createdAtUnixMilli,
        _senderFirstName = senderFirstName;

  // "message_id" field.
  String? _messageId;
  String get messageId => _messageId ?? '';
  set messageId(String? val) => _messageId = val;

  bool hasMessageId() => _messageId != null;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "sender_id" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  set senderId(String? val) => _senderId = val;

  bool hasSenderId() => _senderId != null;

  // "message_text" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  set messageText(String? val) => _messageText = val;

  bool hasMessageText() => _messageText != null;

  // "created_at_unix_milli" field.
  int? _createdAtUnixMilli;
  int get createdAtUnixMilli => _createdAtUnixMilli ?? 0;
  set createdAtUnixMilli(int? val) => _createdAtUnixMilli = val;

  void incrementCreatedAtUnixMilli(int amount) =>
      createdAtUnixMilli = createdAtUnixMilli + amount;

  bool hasCreatedAtUnixMilli() => _createdAtUnixMilli != null;

  // "sender_first_name" field.
  String? _senderFirstName;
  String get senderFirstName => _senderFirstName ?? '';
  set senderFirstName(String? val) => _senderFirstName = val;

  bool hasSenderFirstName() => _senderFirstName != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        messageId: data['message_id'] as String?,
        chatId: data['chat_id'] as String?,
        senderId: data['sender_id'] as String?,
        messageText: data['message_text'] as String?,
        createdAtUnixMilli: castToType<int>(data['created_at_unix_milli']),
        senderFirstName: data['sender_first_name'] as String?,
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message_id': _messageId,
        'chat_id': _chatId,
        'sender_id': _senderId,
        'message_text': _messageText,
        'created_at_unix_milli': _createdAtUnixMilli,
        'sender_first_name': _senderFirstName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message_id': serializeParam(
          _messageId,
          ParamType.String,
        ),
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'sender_id': serializeParam(
          _senderId,
          ParamType.String,
        ),
        'message_text': serializeParam(
          _messageText,
          ParamType.String,
        ),
        'created_at_unix_milli': serializeParam(
          _createdAtUnixMilli,
          ParamType.int,
        ),
        'sender_first_name': serializeParam(
          _senderFirstName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        messageId: deserializeParam(
          data['message_id'],
          ParamType.String,
          false,
        ),
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        senderId: deserializeParam(
          data['sender_id'],
          ParamType.String,
          false,
        ),
        messageText: deserializeParam(
          data['message_text'],
          ParamType.String,
          false,
        ),
        createdAtUnixMilli: deserializeParam(
          data['created_at_unix_milli'],
          ParamType.int,
          false,
        ),
        senderFirstName: deserializeParam(
          data['sender_first_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStruct &&
        messageId == other.messageId &&
        chatId == other.chatId &&
        senderId == other.senderId &&
        messageText == other.messageText &&
        createdAtUnixMilli == other.createdAtUnixMilli &&
        senderFirstName == other.senderFirstName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        messageId,
        chatId,
        senderId,
        messageText,
        createdAtUnixMilli,
        senderFirstName
      ]);
}

MessageStruct createMessageStruct({
  String? messageId,
  String? chatId,
  String? senderId,
  String? messageText,
  int? createdAtUnixMilli,
  String? senderFirstName,
}) =>
    MessageStruct(
      messageId: messageId,
      chatId: chatId,
      senderId: senderId,
      messageText: messageText,
      createdAtUnixMilli: createdAtUnixMilli,
      senderFirstName: senderFirstName,
    );
