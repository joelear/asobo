import '../database.dart';

class CoursesTable extends SupabaseTable<CoursesRow> {
  @override
  String get tableName => 'courses';

  @override
  CoursesRow createRow(Map<String, dynamic> data) => CoursesRow(data);
}

class CoursesRow extends SupabaseDataRow {
  CoursesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoursesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String? get clubId => getField<String>('club_id');
  set clubId(String? value) => setField<String>('club_id', value);

  String? get courseName => getField<String>('course_name');
  set courseName(String? value) => setField<String>('course_name', value);

  int? get holes => getField<int>('holes');
  set holes(int? value) => setField<int>('holes', value);

  int? get par => getField<int>('par');
  set par(int? value) => setField<int>('par', value);

  String? get courseType => getField<String>('course_type');
  set courseType(String? value) => setField<String>('course_type', value);

  String? get courseArchitect => getField<String>('course_architect');
  set courseArchitect(String? value) =>
      setField<String>('course_architect', value);

  String? get openDate => getField<String>('open_date');
  set openDate(String? value) => setField<String>('open_date', value);

  String? get guestPolicy => getField<String>('guest_policy');
  set guestPolicy(String? value) => setField<String>('guest_policy', value);

  int? get weekdayPrice => getField<int>('weekday_price');
  set weekdayPrice(int? value) => setField<int>('weekday_price', value);

  int? get weekendPrice => getField<int>('weekend_price');
  set weekendPrice(int? value) => setField<int>('weekend_price', value);

  int? get twilightPrice => getField<int>('twilight_price');
  set twilightPrice(int? value) => setField<int>('twilight_price', value);

  String? get fairway => getField<String>('fairway');
  set fairway(String? value) => setField<String>('fairway', value);

  String? get green => getField<String>('green');
  set green(String? value) => setField<String>('green', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);
}
