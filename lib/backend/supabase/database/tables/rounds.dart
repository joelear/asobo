import '../database.dart';

class RoundsTable extends SupabaseTable<RoundsRow> {
  @override
  String get tableName => 'rounds';

  @override
  RoundsRow createRow(Map<String, dynamic> data) => RoundsRow(data);
}

class RoundsRow extends SupabaseDataRow {
  RoundsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoundsTable();

  String get roundId => getField<String>('round_id')!;
  set roundId(String value) => setField<String>('round_id', value);

  String? get clubId => getField<String>('club_id');
  set clubId(String? value) => setField<String>('club_id', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  PostgresTime get teeTime => getField<PostgresTime>('tee_time')!;
  set teeTime(PostgresTime value) => setField<PostgresTime>('tee_time', value);

  String get format => getField<String>('format')!;
  set format(String value) => setField<String>('format', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  int get holes => getField<int>('holes')!;
  set holes(int value) => setField<int>('holes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
