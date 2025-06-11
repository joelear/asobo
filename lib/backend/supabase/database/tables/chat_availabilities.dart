import '../database.dart';

class ChatAvailabilitiesTable extends SupabaseTable<ChatAvailabilitiesRow> {
  @override
  String get tableName => 'chat_availabilities';

  @override
  ChatAvailabilitiesRow createRow(Map<String, dynamic> data) =>
      ChatAvailabilitiesRow(data);
}

class ChatAvailabilitiesRow extends SupabaseDataRow {
  ChatAvailabilitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatAvailabilitiesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  bool get morning => getField<bool>('morning')!;
  set morning(bool value) => setField<bool>('morning', value);

  bool get afternoon => getField<bool>('afternoon')!;
  set afternoon(bool value) => setField<bool>('afternoon', value);

  bool get evening => getField<bool>('evening')!;
  set evening(bool value) => setField<bool>('evening', value);
}
