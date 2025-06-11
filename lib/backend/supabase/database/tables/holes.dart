import '../database.dart';

class HolesTable extends SupabaseTable<HolesRow> {
  @override
  String get tableName => 'holes';

  @override
  HolesRow createRow(Map<String, dynamic> data) => HolesRow(data);
}

class HolesRow extends SupabaseDataRow {
  HolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HolesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get courseId => getField<String>('course_id')!;
  set courseId(String value) => setField<String>('course_id', value);

  int get holeNumber => getField<int>('hole_number')!;
  set holeNumber(int value) => setField<int>('hole_number', value);

  int get par => getField<int>('par')!;
  set par(int value) => setField<int>('par', value);

  int? get distance => getField<int>('distance');
  set distance(int? value) => setField<int>('distance', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
