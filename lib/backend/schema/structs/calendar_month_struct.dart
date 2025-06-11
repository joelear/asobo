// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarMonthStruct extends BaseStruct {
  CalendarMonthStruct({
    List<CalendarWeekStruct>? weeks,
    int? month,
    int? year,
    DateTime? firstTimeStamp,
  })  : _weeks = weeks,
        _month = month,
        _year = year,
        _firstTimeStamp = firstTimeStamp;

  // "weeks" field.
  List<CalendarWeekStruct>? _weeks;
  List<CalendarWeekStruct> get weeks => _weeks ?? const [];
  set weeks(List<CalendarWeekStruct>? val) => _weeks = val;

  void updateWeeks(Function(List<CalendarWeekStruct>) updateFn) {
    updateFn(_weeks ??= []);
  }

  bool hasWeeks() => _weeks != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  set month(int? val) => _month = val;

  void incrementMonth(int amount) => month = month + amount;

  bool hasMonth() => _month != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "firstTimeStamp" field.
  DateTime? _firstTimeStamp;
  DateTime? get firstTimeStamp => _firstTimeStamp;
  set firstTimeStamp(DateTime? val) => _firstTimeStamp = val;

  bool hasFirstTimeStamp() => _firstTimeStamp != null;

  static CalendarMonthStruct fromMap(Map<String, dynamic> data) =>
      CalendarMonthStruct(
        weeks: getStructList(
          data['weeks'],
          CalendarWeekStruct.fromMap,
        ),
        month: castToType<int>(data['month']),
        year: castToType<int>(data['year']),
        firstTimeStamp: data['firstTimeStamp'] as DateTime?,
      );

  static CalendarMonthStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarMonthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weeks': _weeks?.map((e) => e.toMap()).toList(),
        'month': _month,
        'year': _year,
        'firstTimeStamp': _firstTimeStamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weeks': serializeParam(
          _weeks,
          ParamType.DataStruct,
          isList: true,
        ),
        'month': serializeParam(
          _month,
          ParamType.int,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'firstTimeStamp': serializeParam(
          _firstTimeStamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CalendarMonthStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarMonthStruct(
        weeks: deserializeStructParam<CalendarWeekStruct>(
          data['weeks'],
          ParamType.DataStruct,
          true,
          structBuilder: CalendarWeekStruct.fromSerializableMap,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.int,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        firstTimeStamp: deserializeParam(
          data['firstTimeStamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CalendarMonthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CalendarMonthStruct &&
        listEquality.equals(weeks, other.weeks) &&
        month == other.month &&
        year == other.year &&
        firstTimeStamp == other.firstTimeStamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([weeks, month, year, firstTimeStamp]);
}

CalendarMonthStruct createCalendarMonthStruct({
  int? month,
  int? year,
  DateTime? firstTimeStamp,
}) =>
    CalendarMonthStruct(
      month: month,
      year: year,
      firstTimeStamp: firstTimeStamp,
    );
