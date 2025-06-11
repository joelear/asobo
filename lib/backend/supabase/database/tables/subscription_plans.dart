import '../database.dart';

class SubscriptionPlansTable extends SupabaseTable<SubscriptionPlansRow> {
  @override
  String get tableName => 'subscription_plans';

  @override
  SubscriptionPlansRow createRow(Map<String, dynamic> data) =>
      SubscriptionPlansRow(data);
}

class SubscriptionPlansRow extends SupabaseDataRow {
  SubscriptionPlansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionPlansTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get stripePriceId => getField<String>('stripe_price_id')!;
  set stripePriceId(String value) => setField<String>('stripe_price_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  String get interval => getField<String>('interval')!;
  set interval(String value) => setField<String>('interval', value);

  String get currency => getField<String>('currency')!;
  set currency(String value) => setField<String>('currency', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
