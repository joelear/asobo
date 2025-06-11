import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String? get sourceUserId => getField<String>('source_user_id');
  set sourceUserId(String? value) => setField<String>('source_user_id', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get imageBlurHash => getField<String>('image_blur_hash');
  set imageBlurHash(String? value) =>
      setField<String>('image_blur_hash', value);

  String? get sourceName => getField<String>('source_name');
  set sourceName(String? value) => setField<String>('source_name', value);

  String? get connectionId => getField<String>('connection_id');
  set connectionId(String? value) => setField<String>('connection_id', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);
}
