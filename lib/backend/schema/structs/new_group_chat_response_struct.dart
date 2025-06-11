// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewGroupChatResponseStruct extends BaseStruct {
  NewGroupChatResponseStruct({
    String? groupName,
    String? groupImageUrl,
    String? groupImageBlurHash,
    String? chatId,
    List<ChatParticipantStruct>? chatParticipants,
  })  : _groupName = groupName,
        _groupImageUrl = groupImageUrl,
        _groupImageBlurHash = groupImageBlurHash,
        _chatId = chatId,
        _chatParticipants = chatParticipants;

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  set groupName(String? val) => _groupName = val;

  bool hasGroupName() => _groupName != null;

  // "group_image_url" field.
  String? _groupImageUrl;
  String get groupImageUrl => _groupImageUrl ?? '';
  set groupImageUrl(String? val) => _groupImageUrl = val;

  bool hasGroupImageUrl() => _groupImageUrl != null;

  // "group_image_blur_hash" field.
  String? _groupImageBlurHash;
  String get groupImageBlurHash => _groupImageBlurHash ?? '';
  set groupImageBlurHash(String? val) => _groupImageBlurHash = val;

  bool hasGroupImageBlurHash() => _groupImageBlurHash != null;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  set chatId(String? val) => _chatId = val;

  bool hasChatId() => _chatId != null;

  // "chatParticipants" field.
  List<ChatParticipantStruct>? _chatParticipants;
  List<ChatParticipantStruct> get chatParticipants =>
      _chatParticipants ?? const [];
  set chatParticipants(List<ChatParticipantStruct>? val) =>
      _chatParticipants = val;

  void updateChatParticipants(Function(List<ChatParticipantStruct>) updateFn) {
    updateFn(_chatParticipants ??= []);
  }

  bool hasChatParticipants() => _chatParticipants != null;

  static NewGroupChatResponseStruct fromMap(Map<String, dynamic> data) =>
      NewGroupChatResponseStruct(
        groupName: data['group_name'] as String?,
        groupImageUrl: data['group_image_url'] as String?,
        groupImageBlurHash: data['group_image_blur_hash'] as String?,
        chatId: data['chat_id'] as String?,
        chatParticipants: getStructList(
          data['chatParticipants'],
          ChatParticipantStruct.fromMap,
        ),
      );

  static NewGroupChatResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? NewGroupChatResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'group_name': _groupName,
        'group_image_url': _groupImageUrl,
        'group_image_blur_hash': _groupImageBlurHash,
        'chat_id': _chatId,
        'chatParticipants': _chatParticipants?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'group_name': serializeParam(
          _groupName,
          ParamType.String,
        ),
        'group_image_url': serializeParam(
          _groupImageUrl,
          ParamType.String,
        ),
        'group_image_blur_hash': serializeParam(
          _groupImageBlurHash,
          ParamType.String,
        ),
        'chat_id': serializeParam(
          _chatId,
          ParamType.String,
        ),
        'chatParticipants': serializeParam(
          _chatParticipants,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NewGroupChatResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NewGroupChatResponseStruct(
        groupName: deserializeParam(
          data['group_name'],
          ParamType.String,
          false,
        ),
        groupImageUrl: deserializeParam(
          data['group_image_url'],
          ParamType.String,
          false,
        ),
        groupImageBlurHash: deserializeParam(
          data['group_image_blur_hash'],
          ParamType.String,
          false,
        ),
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.String,
          false,
        ),
        chatParticipants: deserializeStructParam<ChatParticipantStruct>(
          data['chatParticipants'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatParticipantStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NewGroupChatResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewGroupChatResponseStruct &&
        groupName == other.groupName &&
        groupImageUrl == other.groupImageUrl &&
        groupImageBlurHash == other.groupImageBlurHash &&
        chatId == other.chatId &&
        listEquality.equals(chatParticipants, other.chatParticipants);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [groupName, groupImageUrl, groupImageBlurHash, chatId, chatParticipants]);
}

NewGroupChatResponseStruct createNewGroupChatResponseStruct({
  String? groupName,
  String? groupImageUrl,
  String? groupImageBlurHash,
  String? chatId,
}) =>
    NewGroupChatResponseStruct(
      groupName: groupName,
      groupImageUrl: groupImageUrl,
      groupImageBlurHash: groupImageBlurHash,
      chatId: chatId,
    );
