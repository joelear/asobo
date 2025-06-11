// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarStruct extends BaseStruct {
  CalendarStruct({
    List<CalendarMonthStruct>? months,
  }) : _months = months;

  // "months" field.
  List<CalendarMonthStruct>? _months;
  List<CalendarMonthStruct> get months => _months ?? const [];
  set months(List<CalendarMonthStruct>? val) => _months = val;

  void updateMonths(Function(List<CalendarMonthStruct>) updateFn) {
    updateFn(_months ??= []);
  }

  bool hasMonths() => _months != null;

  static CalendarStruct fromMap(Map<String, dynamic> data) => CalendarStruct(
        months: getStructList(
          data['months'],
          CalendarMonthStruct.fromMap,
        ),
      );

  static CalendarStruct? maybeFromMap(dynamic data) =>
      data is Map ? CalendarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'months': _months?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'months': serializeParam(
          _months,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CalendarStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarStruct(
        months: deserializeStructParam<CalendarMonthStruct>(
          data['months'],
          ParamType.DataStruct,
          true,
          structBuilder: CalendarMonthStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CalendarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CalendarStruct && listEquality.equals(months, other.months);
  }

  @override
  int get hashCode => const ListEquality().hash([months]);
}

CalendarStruct createCalendarStruct() => CalendarStruct();
