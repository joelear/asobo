import '../database.dart';

class ConnectionsTable extends SupabaseTable<ConnectionsRow> {
  @override
  String get tableName => 'connections';

  @override
  ConnectionsRow createRow(Map<String, dynamic> data) => ConnectionsRow(data);
}

class ConnectionsRow extends SupabaseDataRow {
  ConnectionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConnectionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get senderUserId => getField<String>('sender_user_id')!;
  set senderUserId(String value) => setField<String>('sender_user_id', value);

  String get recipientUserId => getField<String>('recipient_user_id')!;
  set recipientUserId(String value) =>
      setField<String>('recipient_user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
