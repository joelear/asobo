import '../database.dart';

class RoundParticipantsTable extends SupabaseTable<RoundParticipantsRow> {
  @override
  String get tableName => 'round_participants';

  @override
  RoundParticipantsRow createRow(Map<String, dynamic> data) =>
      RoundParticipantsRow(data);
}

class RoundParticipantsRow extends SupabaseDataRow {
  RoundParticipantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoundParticipantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get roundId => getField<String>('round_id')!;
  set roundId(String value) => setField<String>('round_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  bool? get confirmed => getField<bool>('confirmed');
  set confirmed(bool? value) => setField<bool>('confirmed', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);

  int? get strokes => getField<int>('strokes');
  set strokes(int? value) => setField<int>('strokes', value);

  int? get strokesToPar => getField<int>('strokes_to_par');
  set strokesToPar(int? value) => setField<int>('strokes_to_par', value);
}
