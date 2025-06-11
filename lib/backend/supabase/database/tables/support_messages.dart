import '../database.dart';

class SupportMessagesTable extends SupabaseTable<SupportMessagesRow> {
  @override
  String get tableName => 'support_messages';

  @override
  SupportMessagesRow createRow(Map<String, dynamic> data) =>
      SupportMessagesRow(data);
}

class SupportMessagesRow extends SupabaseDataRow {
  SupportMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportMessagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);
}
