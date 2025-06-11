import '../database.dart';

class ChatNotificationsTable extends SupabaseTable<ChatNotificationsRow> {
  @override
  String get tableName => 'chat_notifications';

  @override
  ChatNotificationsRow createRow(Map<String, dynamic> data) =>
      ChatNotificationsRow(data);
}

class ChatNotificationsRow extends SupabaseDataRow {
  ChatNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatNotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get messageId => getField<int>('message_id');
  set messageId(int? value) => setField<int>('message_id', value);

  String? get recipientId => getField<String>('recipient_id');
  set recipientId(String? value) => setField<String>('recipient_id', value);
}
