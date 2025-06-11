import '../database.dart';

class UserEndorsementsTable extends SupabaseTable<UserEndorsementsRow> {
  @override
  String get tableName => 'user_endorsements';

  @override
  UserEndorsementsRow createRow(Map<String, dynamic> data) =>
      UserEndorsementsRow(data);
}

class UserEndorsementsRow extends SupabaseDataRow {
  UserEndorsementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserEndorsementsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get endorsedUserId => getField<String>('endorsed_user_id')!;
  set endorsedUserId(String value) =>
      setField<String>('endorsed_user_id', value);

  String get endorserUserId => getField<String>('endorser_user_id')!;
  set endorserUserId(String value) =>
      setField<String>('endorser_user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
