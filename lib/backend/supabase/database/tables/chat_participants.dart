import '../database.dart';

class ChatParticipantsTable extends SupabaseTable<ChatParticipantsRow> {
  @override
  String get tableName => 'chat_participants';

  @override
  ChatParticipantsRow createRow(Map<String, dynamic> data) =>
      ChatParticipantsRow(data);
}

class ChatParticipantsRow extends SupabaseDataRow {
  ChatParticipantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatParticipantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  DateTime? get addedAt => getField<DateTime>('added_at');
  set addedAt(DateTime? value) => setField<DateTime>('added_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
