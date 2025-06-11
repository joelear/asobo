import '../database.dart';

class SecureConfigTable extends SupabaseTable<SecureConfigRow> {
  @override
  String get tableName => 'secure_config';

  @override
  SecureConfigRow createRow(Map<String, dynamic> data) => SecureConfigRow(data);
}

class SecureConfigRow extends SupabaseDataRow {
  SecureConfigRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SecureConfigTable();

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);
}
