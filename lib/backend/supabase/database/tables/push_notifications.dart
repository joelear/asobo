import '../database.dart';

class PushNotificationsTable extends SupabaseTable<PushNotificationsRow> {
  @override
  String get tableName => 'push_notifications';

  @override
  PushNotificationsRow createRow(Map<String, dynamic> data) =>
      PushNotificationsRow(data);
}

class PushNotificationsRow extends SupabaseDataRow {
  PushNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PushNotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get body => getField<String>('body')!;
  set body(String value) => setField<String>('body', value);

  String get recipientId => getField<String>('recipient_id')!;
  set recipientId(String value) => setField<String>('recipient_id', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);

  String? get subtitle => getField<String>('subtitle');
  set subtitle(String? value) => setField<String>('subtitle', value);
}
