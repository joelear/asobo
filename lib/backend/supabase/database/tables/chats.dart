import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  bool get isGroup => getField<bool>('is_group')!;
  set isGroup(bool value) => setField<bool>('is_group', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool get deleted => getField<bool>('deleted')!;
  set deleted(bool value) => setField<bool>('deleted', value);

  String? get groupName => getField<String>('group_name');
  set groupName(String? value) => setField<String>('group_name', value);

  String? get groupImageUrl => getField<String>('group_image_url');
  set groupImageUrl(String? value) =>
      setField<String>('group_image_url', value);

  String? get groupImageBlurHash => getField<String>('group_image_blur_hash');
  set groupImageBlurHash(String? value) =>
      setField<String>('group_image_blur_hash', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get lastMessageSenderId => getField<String>('last_message_sender_id');
  set lastMessageSenderId(String? value) =>
      setField<String>('last_message_sender_id', value);

  String? get lastMessageSenderFirstName =>
      getField<String>('last_message_sender_first_name');
  set lastMessageSenderFirstName(String? value) =>
      setField<String>('last_message_sender_first_name', value);
}
