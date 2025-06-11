// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewChatResponseStruct extends BaseStruct {
  NewChatResponseStruct({
    String? chatId,
    bool? isNew,
  })  : _chatId = chatId,
        _isNew = isNew;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "is_new" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  set isNew(bool? val) => _isNew = val;

  bool hasIsNew() => _isNew != null;

  static NewChatResponseStruct fromMap(Map<String, dynamic> data) =>
      NewChatResponseStruct(
        chatId: data['chat_id'] as String?,
        isNew: data['is_new'] as bool?,
      );

  static NewChatResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? NewChatResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'is_new': _isNew,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'is_new': serializeParam(
          _isNew,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NewChatResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewChatResponseStruct(
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        isNew: deserializeParam(
          data['is_new'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NewChatResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewChatResponseStruct &&
        chatId == other.chatId &&
        isNew == other.isNew;
  }

  @override
  int get hashCode => const ListEquality().hash([chatId, isNew]);
}

NewChatResponseStruct createNewChatResponseStruct({
  String? chatId,
  bool? isNew,
}) =>
    NewChatResponseStruct(
      chatId: chatId,
      isNew: isNew,
    );
