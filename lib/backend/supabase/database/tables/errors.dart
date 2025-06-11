import '../database.dart';

class ErrorsTable extends SupabaseTable<ErrorsRow> {
  @override
  String get tableName => 'errors';

  @override
  ErrorsRow createRow(Map<String, dynamic> data) => ErrorsRow(data);
}

class ErrorsRow extends SupabaseDataRow {
  ErrorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ErrorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);

  String? get stackTrace => getField<String>('stack_trace');
  set stackTrace(String? value) => setField<String>('stack_trace', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get devicePlatform => getField<String>('device_platform');
  set devicePlatform(String? value) =>
      setField<String>('device_platform', value);

  String? get appVersion => getField<String>('app_version');
  set appVersion(String? value) => setField<String>('app_version', value);
}
