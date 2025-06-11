import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get profileImageUrl => getField<String>('profile_image_url');
  set profileImageUrl(String? value) =>
      setField<String>('profile_image_url', value);

  double? get handicap => getField<double>('handicap');
  set handicap(double? value) => setField<double>('handicap', value);

  String? get referralCode => getField<String>('referral_code');
  set referralCode(String? value) => setField<String>('referral_code', value);

  String? get referredBy => getField<String>('referred_by');
  set referredBy(String? value) => setField<String>('referred_by', value);

  String? get locationHomeCityId => getField<String>('location_home_city_id');
  set locationHomeCityId(String? value) =>
      setField<String>('location_home_city_id', value);

  String? get locationHomeCity => getField<String>('location_home_city');
  set locationHomeCity(String? value) =>
      setField<String>('location_home_city', value);

  String? get occupation => getField<String>('occupation');
  set occupation(String? value) => setField<String>('occupation', value);

  bool get waitlist => getField<bool>('waitlist')!;
  set waitlist(bool value) => setField<bool>('waitlist', value);

  String? get stripeId => getField<String>('stripe_id');
  set stripeId(String? value) => setField<String>('stripe_id', value);

  String? get membershipStatus => getField<String>('membership_status');
  set membershipStatus(String? value) =>
      setField<String>('membership_status', value);

  bool get deleted => getField<bool>('deleted')!;
  set deleted(bool value) => setField<bool>('deleted', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get profileImageBlurHash =>
      getField<String>('profile_image_blur_hash');
  set profileImageBlurHash(String? value) =>
      setField<String>('profile_image_blur_hash', value);

  String? get onboardingStage => getField<String>('onboarding_stage');
  set onboardingStage(String? value) =>
      setField<String>('onboarding_stage', value);

  String? get firstLastUsername => getField<String>('first_last_username');
  set firstLastUsername(String? value) =>
      setField<String>('first_last_username', value);

  String? get homeClub => getField<String>('home_club');
  set homeClub(String? value) => setField<String>('home_club', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get endorsersCount => getField<int>('endorsers_count');
  set endorsersCount(int? value) => setField<int>('endorsers_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get onesignalPlayerId => getField<String>('onesignal_player_id');
  set onesignalPlayerId(String? value) =>
      setField<String>('onesignal_player_id', value);
}
