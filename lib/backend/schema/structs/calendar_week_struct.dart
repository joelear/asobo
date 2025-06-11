// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarWeekStruct extends BaseStruct {
  CalendarWeekStruct({
    List<CalendarDayStruct>? days,
  }) : _days = days;

  // "days" field.
  List<CalendarDayStruct>? _days;
  List<CalendarDayStruct> get days => _days ?? const [];
  set days(List<CalendarDayStruct>? val) => _days = val;

  void updateDays(Function(List<CalendarDayStruct>) updateFn) {
    updateFn(_days ??= []);
  }

  bool hasDays() => _days != null;

  static CalendarWeekStruct fromMap(Map<String, dynamic> data) =>
      CalendarWeekStruct(
        days: getStructList(
          data['days'],
          CalendarDayStruct.fromMap,
        ),
      );

  static CalendarWeekStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarWeekStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'days': _days?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CalendarWeekStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarWeekStruct(
        days: deserializeStructParam<CalendarDayStruct>(
          data['days'],
          ParamType.DataStruct,
          true,
          structBuilder: CalendarDayStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CalendarWeekStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CalendarWeekStruct && listEquality.equals(days, other.days);
  }

  @override
  int get hashCode => const ListEquality().hash([days]);
}

CalendarWeekStruct createCalendarWeekStruct() => CalendarWeekStruct();
