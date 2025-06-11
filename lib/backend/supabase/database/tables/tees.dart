import '../database.dart';

class TeesTable extends SupabaseTable<TeesRow> {
  @override
  String get tableName => 'tees';

  @override
  TeesRow createRow(Map<String, dynamic> data) => TeesRow(data);
}

class TeesRow extends SupabaseDataRow {
  TeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeesTable();

  String? get teeId => getField<String>('tee_id');
  set teeId(String? value) => setField<String>('tee_id', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String? get teeName => getField<String>('tee_name');
  set teeName(String? value) => setField<String>('tee_name', value);

  String? get teeColor => getField<String>('tee_color');
  set teeColor(String? value) => setField<String>('tee_color', value);

  int? get teePar => getField<int>('tee_par');
  set teePar(int? value) => setField<int>('tee_par', value);

  String? get rating => getField<String>('rating');
  set rating(String? value) => setField<String>('rating', value);

  String? get slope => getField<String>('slope');
  set slope(String? value) => setField<String>('slope', value);

  int? get hole1Distance => getField<int>('hole_1_distance');
  set hole1Distance(int? value) => setField<int>('hole_1_distance', value);

  int? get hole2Distance => getField<int>('hole_2_distance');
  set hole2Distance(int? value) => setField<int>('hole_2_distance', value);

  int? get hole3Distance => getField<int>('hole_3_distance');
  set hole3Distance(int? value) => setField<int>('hole_3_distance', value);

  int? get hole4Distance => getField<int>('hole_4_distance');
  set hole4Distance(int? value) => setField<int>('hole_4_distance', value);

  int? get hole5Distance => getField<int>('hole_5_distance');
  set hole5Distance(int? value) => setField<int>('hole_5_distance', value);

  int? get hole6Distance => getField<int>('hole_6_distance');
  set hole6Distance(int? value) => setField<int>('hole_6_distance', value);

  int? get hole7Distance => getField<int>('hole_7_distance');
  set hole7Distance(int? value) => setField<int>('hole_7_distance', value);

  int? get hole8Distance => getField<int>('hole_8_distance');
  set hole8Distance(int? value) => setField<int>('hole_8_distance', value);

  int? get hole9Distance => getField<int>('hole_9_distance');
  set hole9Distance(int? value) => setField<int>('hole_9_distance', value);

  int? get hole10Distance => getField<int>('hole_10_distance');
  set hole10Distance(int? value) => setField<int>('hole_10_distance', value);

  int? get hole11Distance => getField<int>('hole_11_distance');
  set hole11Distance(int? value) => setField<int>('hole_11_distance', value);

  int? get hole12Distance => getField<int>('hole_12_distance');
  set hole12Distance(int? value) => setField<int>('hole_12_distance', value);

  int? get hole13Distance => getField<int>('hole_13_distance');
  set hole13Distance(int? value) => setField<int>('hole_13_distance', value);

  int? get hole14Distance => getField<int>('hole_14_distance');
  set hole14Distance(int? value) => setField<int>('hole_14_distance', value);

  int? get hole15Distance => getField<int>('hole_15_distance');
  set hole15Distance(int? value) => setField<int>('hole_15_distance', value);

  int? get hole16Distance => getField<int>('hole_16_distance');
  set hole16Distance(int? value) => setField<int>('hole_16_distance', value);

  int? get hole17Distance => getField<int>('hole_17_distance');
  set hole17Distance(int? value) => setField<int>('hole_17_distance', value);

  int? get hole18Distance => getField<int>('hole_18_distance');
  set hole18Distance(int? value) => setField<int>('hole_18_distance', value);

  int? get totalDistance => getField<int>('total_distance');
  set totalDistance(int? value) => setField<int>('total_distance', value);

  int? get hole1Par => getField<int>('hole_1_par');
  set hole1Par(int? value) => setField<int>('hole_1_par', value);

  int? get hole2Par => getField<int>('hole_2_par');
  set hole2Par(int? value) => setField<int>('hole_2_par', value);

  int? get hole3Par => getField<int>('hole_3_par');
  set hole3Par(int? value) => setField<int>('hole_3_par', value);

  int? get hole4Par => getField<int>('hole_4_par');
  set hole4Par(int? value) => setField<int>('hole_4_par', value);

  int? get hole5Par => getField<int>('hole_5_par');
  set hole5Par(int? value) => setField<int>('hole_5_par', value);

  int? get hole6Par => getField<int>('hole_6_par');
  set hole6Par(int? value) => setField<int>('hole_6_par', value);

  int? get hole7Par => getField<int>('hole_7_par');
  set hole7Par(int? value) => setField<int>('hole_7_par', value);

  int? get hole8Par => getField<int>('hole_8_par');
  set hole8Par(int? value) => setField<int>('hole_8_par', value);

  int? get hole9Par => getField<int>('hole_9_par');
  set hole9Par(int? value) => setField<int>('hole_9_par', value);

  int? get hole10Par => getField<int>('hole_10_par');
  set hole10Par(int? value) => setField<int>('hole_10_par', value);

  int? get hole11Par => getField<int>('hole_11_par');
  set hole11Par(int? value) => setField<int>('hole_11_par', value);

  int? get hole12Par => getField<int>('hole_12_par');
  set hole12Par(int? value) => setField<int>('hole_12_par', value);

  int? get hole13Par => getField<int>('hole_13_par');
  set hole13Par(int? value) => setField<int>('hole_13_par', value);

  int? get hole14Par => getField<int>('hole_14_par');
  set hole14Par(int? value) => setField<int>('hole_14_par', value);

  int? get hole15Par => getField<int>('hole_15_par');
  set hole15Par(int? value) => setField<int>('hole_15_par', value);

  int? get hole16Par => getField<int>('hole_16_par');
  set hole16Par(int? value) => setField<int>('hole_16_par', value);

  int? get hole17Par => getField<int>('hole_17_par');
  set hole17Par(int? value) => setField<int>('hole_17_par', value);

  int? get hole18Par => getField<int>('hole_18_par');
  set hole18Par(int? value) => setField<int>('hole_18_par', value);

  int? get hole1Handicap => getField<int>('hole_1_handicap');
  set hole1Handicap(int? value) => setField<int>('hole_1_handicap', value);

  int? get hole2Handicap => getField<int>('hole_2_handicap');
  set hole2Handicap(int? value) => setField<int>('hole_2_handicap', value);

  int? get hole3Handicap => getField<int>('hole_3_handicap');
  set hole3Handicap(int? value) => setField<int>('hole_3_handicap', value);

  int? get hole4Handicap => getField<int>('hole_4_handicap');
  set hole4Handicap(int? value) => setField<int>('hole_4_handicap', value);

  int? get hole5Handicap => getField<int>('hole_5_handicap');
  set hole5Handicap(int? value) => setField<int>('hole_5_handicap', value);

  int? get hole6Handicap => getField<int>('hole_6_handicap');
  set hole6Handicap(int? value) => setField<int>('hole_6_handicap', value);

  int? get hole7Handicap => getField<int>('hole_7_handicap');
  set hole7Handicap(int? value) => setField<int>('hole_7_handicap', value);

  int? get hole8Handicap => getField<int>('hole_8_handicap');
  set hole8Handicap(int? value) => setField<int>('hole_8_handicap', value);

  int? get hole9Handicap => getField<int>('hole_9_handicap');
  set hole9Handicap(int? value) => setField<int>('hole_9_handicap', value);

  int? get hole10Handicap => getField<int>('hole_10_handicap');
  set hole10Handicap(int? value) => setField<int>('hole_10_handicap', value);

  int? get hole11Handicap => getField<int>('hole_11_handicap');
  set hole11Handicap(int? value) => setField<int>('hole_11_handicap', value);

  int? get hole12Handicap => getField<int>('hole_12_handicap');
  set hole12Handicap(int? value) => setField<int>('hole_12_handicap', value);

  int? get hole13Handicap => getField<int>('hole_13_handicap');
  set hole13Handicap(int? value) => setField<int>('hole_13_handicap', value);

  int? get hole14Handicap => getField<int>('hole_14_handicap');
  set hole14Handicap(int? value) => setField<int>('hole_14_handicap', value);

  int? get hole15Handicap => getField<int>('hole_15_handicap');
  set hole15Handicap(int? value) => setField<int>('hole_15_handicap', value);

  int? get hole16Handicap => getField<int>('hole_16_handicap');
  set hole16Handicap(int? value) => setField<int>('hole_16_handicap', value);

  int? get hole17Handicap => getField<int>('hole_17_handicap');
  set hole17Handicap(int? value) => setField<int>('hole_17_handicap', value);

  int? get hole18Handicap => getField<int>('hole_18_handicap');
  set hole18Handicap(int? value) => setField<int>('hole_18_handicap', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
