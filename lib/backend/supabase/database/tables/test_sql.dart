import '../database.dart';

class TestSqlTable extends SupabaseTable<TestSqlRow> {
  @override
  String get tableName => 'test_sql';

  @override
  TestSqlRow createRow(Map<String, dynamic> data) => TestSqlRow(data);
}

class TestSqlRow extends SupabaseDataRow {
  TestSqlRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestSqlTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get thing1 => getField<String>('thing_1');
  set thing1(String? value) => setField<String>('thing_1', value);

  String? get thing2 => getField<String>('thing_2');
  set thing2(String? value) => setField<String>('thing_2', value);
}
