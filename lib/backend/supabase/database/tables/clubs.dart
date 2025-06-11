import '../database.dart';

class ClubsTable extends SupabaseTable<ClubsRow> {
  @override
  String get tableName => 'clubs';

  @override
  ClubsRow createRow(Map<String, dynamic> data) => ClubsRow(data);
}

class ClubsRow extends SupabaseDataRow {
  ClubsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClubsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get clubName => getField<String>('club_name');
  set clubName(String? value) => setField<String>('club_name', value);

  String? get clubMembership => getField<String>('club_membership');
  set clubMembership(String? value) =>
      setField<String>('club_membership', value);

  int? get numberOfHoles => getField<int>('number_of_holes');
  set numberOfHoles(int? value) => setField<int>('number_of_holes', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get fax => getField<String>('fax');
  set fax(String? value) => setField<String>('fax', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  String? get contactName => getField<String>('contact_name');
  set contactName(String? value) => setField<String>('contact_name', value);

  String? get contactTitle => getField<String>('contact_title');
  set contactTitle(String? value) => setField<String>('contact_title', value);

  String? get emailAddress => getField<String>('email_address');
  set emailAddress(String? value) => setField<String>('email_address', value);

  bool? get drivingRange => getField<bool>('driving_range');
  set drivingRange(bool? value) => setField<bool>('driving_range', value);

  bool? get puttingGreen => getField<bool>('putting_green');
  set puttingGreen(bool? value) => setField<bool>('putting_green', value);

  bool? get chippingGreen => getField<bool>('chipping_green');
  set chippingGreen(bool? value) => setField<bool>('chipping_green', value);

  bool? get practiceBunker => getField<bool>('practice_bunker');
  set practiceBunker(bool? value) => setField<bool>('practice_bunker', value);

  bool? get motorCart => getField<bool>('motor_cart');
  set motorCart(bool? value) => setField<bool>('motor_cart', value);

  bool? get pullCart => getField<bool>('pull_cart');
  set pullCart(bool? value) => setField<bool>('pull_cart', value);

  bool? get golfClubsRental => getField<bool>('golf_clubs_rental');
  set golfClubsRental(bool? value) =>
      setField<bool>('golf_clubs_rental', value);

  bool? get clubFitting => getField<bool>('club_fitting');
  set clubFitting(bool? value) => setField<bool>('club_fitting', value);

  bool? get proShop => getField<bool>('pro_shop');
  set proShop(bool? value) => setField<bool>('pro_shop', value);

  bool? get golfLessons => getField<bool>('golf_lessons');
  set golfLessons(bool? value) => setField<bool>('golf_lessons', value);

  bool? get caddieHire => getField<bool>('caddie_hire');
  set caddieHire(bool? value) => setField<bool>('caddie_hire', value);

  bool? get restaurant => getField<bool>('restaurant');
  set restaurant(bool? value) => setField<bool>('restaurant', value);

  bool? get receptionHall => getField<bool>('reception_hall');
  set receptionHall(bool? value) => setField<bool>('reception_hall', value);

  bool? get changingRoom => getField<bool>('changing_room');
  set changingRoom(bool? value) => setField<bool>('changing_room', value);

  bool? get lockers => getField<bool>('lockers');
  set lockers(bool? value) => setField<bool>('lockers', value);

  bool? get lodgingOnSite => getField<bool>('lodging_on_site');
  set lodgingOnSite(bool? value) => setField<bool>('lodging_on_site', value);

  String? get clubId => getField<String>('club_id');
  set clubId(String? value) => setField<String>('club_id', value);
}
