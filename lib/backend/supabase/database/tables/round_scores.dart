import '../database.dart';

class RoundScoresTable extends SupabaseTable<RoundScoresRow> {
  @override
  String get tableName => 'round_scores';

  @override
  RoundScoresRow createRow(Map<String, dynamic> data) => RoundScoresRow(data);
}

class RoundScoresRow extends SupabaseDataRow {
  RoundScoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoundScoresTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get roundParticipantId => getField<String>('round_participant_id')!;
  set roundParticipantId(String value) =>
      setField<String>('round_participant_id', value);

  int get holeNumber => getField<int>('hole_number')!;
  set holeNumber(int value) => setField<int>('hole_number', value);

  int get strokes => getField<int>('strokes')!;
  set strokes(int value) => setField<int>('strokes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
