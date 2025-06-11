// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends BaseStruct {
  ChatStruct({
    String? chatId,
    String? chatName,
    String? chatImageBlurHash,
    bool? isGroup,
    String? lastMessage,
    String? draftMessage,
    String? chatImageUrl,
    int? lastMessageTimeUnixMilli,
    String? lastMessageSenderId,
    String? lastMessageSenderFirstName,
  })  : _chatId = chatId,
        _chatName = chatName,
        _chatImageBlurHash = chatImageBlurHash,
        _isGroup = isGroup,
        _lastMessage = lastMessage,
        _draftMessage = draftMessage,
        _chatImageUrl = chatImageUrl,
        _lastMessageTimeUnixMilli = lastMessageTimeUnixMilli,
        _lastMessageSenderId = lastMessageSenderId,
        _lastMessageSenderFirstName = lastMessageSenderFirstName;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "chat_name" field.
  String? _chatName;
  String get chatName => _chatName ?? '';
  set chatName(String? val) => _chatName = val;

  bool hasChatName() => _chatName != null;

  // "chat_image_blur_hash" field.
  String? _chatImageBlurHash;
  String get chatImageBlurHash => _chatImageBlurHash ?? '';
  set chatImageBlurHash(String? val) => _chatImageBlurHash = val;

  bool hasChatImageBlurHash() => _chatImageBlurHash != null;

  // "is_group" field.
  bool? _isGroup;
  bool get isGroup => _isGroup ?? false;
  set isGroup(bool? val) => _isGroup = val;

  bool hasIsGroup() => _isGroup != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;

  bool hasLastMessage() => _lastMessage != null;

  // "draft_message" field.
  String? _draftMessage;
  String get draftMessage => _draftMessage ?? '';
  set draftMessage(String? val) => _draftMessage = val;

  bool hasDraftMessage() => _draftMessage != null;

  // "chat_image_url" field.
  String? _chatImageUrl;
  String get chatImageUrl => _chatImageUrl ?? '';
  set chatImageUrl(String? val) => _chatImageUrl = val;

  bool hasChatImageUrl() => _chatImageUrl != null;

  // "last_message_time_unix_milli" field.
  int? _lastMessageTimeUnixMilli;
  int get lastMessageTimeUnixMilli => _lastMessageTimeUnixMilli ?? 0;
  set lastMessageTimeUnixMilli(int? val) => _lastMessageTimeUnixMilli = val;

  void incrementLastMessageTimeUnixMilli(int amount) =>
      lastMessageTimeUnixMilli = lastMessageTimeUnixMilli + amount;

  bool hasLastMessageTimeUnixMilli() => _lastMessageTimeUnixMilli != null;

  // "last_message_sender_id" field.
  String? _lastMessageSenderId;
  String get lastMessageSenderId => _lastMessageSenderId ?? '';
  set lastMessageSenderId(String? val) => _lastMessageSenderId = val;

  bool hasLastMessageSenderId() => _lastMessageSenderId != null;

  // "last_message_sender_first_name" field.
  String? _lastMessageSenderFirstName;
  String get lastMessageSenderFirstName => _lastMessageSenderFirstName ?? '';
  set lastMessageSenderFirstName(String? val) =>
      _lastMessageSenderFirstName = val;

  bool hasLastMessageSenderFirstName() => _lastMessageSenderFirstName != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        chatId: data['chat_id'] as String?,
        chatName: data['chat_name'] as String?,
        chatImageBlurHash: data['chat_image_blur_hash'] as String?,
        isGroup: data['is_group'] as bool?,
        lastMessage: data['last_message'] as String?,
        draftMessage: data['draft_message'] as String?,
        chatImageUrl: data['chat_image_url'] as String?,
        lastMessageTimeUnixMilli:
            castToType<int>(data['last_message_time_unix_milli']),
        lastMessageSenderId: data['last_message_sender_id'] as String?,
        lastMessageSenderFirstName:
            data['last_message_sender_first_name'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'chat_name': _chatName,
        'chat_image_blur_hash': _chatImageBlurHash,
        'is_group': _isGroup,
        'last_message': _lastMessage,
        'draft_message': _draftMessage,
        'chat_image_url': _chatImageUrl,
        'last_message_time_unix_milli': _lastMessageTimeUnixMilli,
        'last_message_sender_id': _lastMessageSenderId,
        'last_message_sender_first_name': _lastMessageSenderFirstName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'chat_name': serializeParam(
          _chatName,
          ParamType.String,
        ),
        'chat_image_blur_hash': serializeParam(
          _chatImageBlurHash,
          ParamType.String,
        ),
        'is_group': serializeParam(
          _isGroup,
          ParamType.bool,
        ),
        'last_message': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'draft_message': serializeParam(
          _draftMessage,
          ParamType.String,
        ),
        'chat_image_url': serializeParam(
          _chatImageUrl,
          ParamType.String,
        ),
        'last_message_time_unix_milli': serializeParam(
          _lastMessageTimeUnixMilli,
          ParamType.int,
        ),
        'last_message_sender_id': serializeParam(
          _lastMessageSenderId,
          ParamType.String,
        ),
        'last_message_sender_first_name': serializeParam(
          _lastMessageSenderFirstName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        chatName: deserializeParam(
          data['chat_name'],
          ParamType.String,
          false,
        ),
        chatImageBlurHash: deserializeParam(
          data['chat_image_blur_hash'],
          ParamType.String,
          false,
        ),
        isGroup: deserializeParam(
          data['is_group'],
          ParamType.bool,
          false,
        ),
        lastMessage: deserializeParam(
          data['last_message'],
          ParamType.String,
          false,
        ),
        draftMessage: deserializeParam(
          data['draft_message'],
          ParamType.String,
          false,
        ),
        chatImageUrl: deserializeParam(
          data['chat_image_url'],
          ParamType.String,
          false,
        ),
        lastMessageTimeUnixMilli: deserializeParam(
          data['last_message_time_unix_milli'],
          ParamType.int,
          false,
        ),
        lastMessageSenderId: deserializeParam(
          data['last_message_sender_id'],
          ParamType.String,
          false,
        ),
        lastMessageSenderFirstName: deserializeParam(
          data['last_message_sender_first_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        chatId == other.chatId &&
        chatName == other.chatName &&
        chatImageBlurHash == other.chatImageBlurHash &&
        isGroup == other.isGroup &&
        lastMessage == other.lastMessage &&
        draftMessage == other.draftMessage &&
        chatImageUrl == other.chatImageUrl &&
        lastMessageTimeUnixMilli == other.lastMessageTimeUnixMilli &&
        lastMessageSenderId == other.lastMessageSenderId &&
        lastMessageSenderFirstName == other.lastMessageSenderFirstName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatId,
        chatName,
        chatImageBlurHash,
        isGroup,
        lastMessage,
        draftMessage,
        chatImageUrl,
        lastMessageTimeUnixMilli,
        lastMessageSenderId,
        lastMessageSenderFirstName
      ]);
}

ChatStruct createChatStruct({
  String? chatId,
  String? chatName,
  String? chatImageBlurHash,
  bool? isGroup,
  String? lastMessage,
  String? draftMessage,
  String? chatImageUrl,
  int? lastMessageTimeUnixMilli,
  String? lastMessageSenderId,
  String? lastMessageSenderFirstName,
}) =>
    ChatStruct(
      chatId: chatId,
      chatName: chatName,
      chatImageBlurHash: chatImageBlurHash,
      isGroup: isGroup,
      lastMessage: lastMessage,
      draftMessage: draftMessage,
      chatImageUrl: chatImageUrl,
      lastMessageTimeUnixMilli: lastMessageTimeUnixMilli,
      lastMessageSenderId: lastMessageSenderId,
      lastMessageSenderFirstName: lastMessageSenderFirstName,
    );
