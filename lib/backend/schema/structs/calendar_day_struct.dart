// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarDayStruct extends BaseStruct {
  CalendarDayStruct({
    DateTime? date,
    bool? isVisible,
  })  : _date = date,
        _isVisible = isVisible;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "isVisible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  static CalendarDayStruct fromMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        date: data['date'] as DateTime?,
        isVisible: data['isVisible'] as bool?,
      );

  static CalendarDayStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarDayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'isVisible': _isVisible,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'isVisible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CalendarDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarDayStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        isVisible: deserializeParam(
          data['isVisible'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CalendarDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarDayStruct &&
        date == other.date &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode => const ListEquality().hash([date, isVisible]);
}

CalendarDayStruct createCalendarDayStruct({
  DateTime? date,
  bool? isVisible,
}) =>
    CalendarDayStruct(
      date: date,
      isVisible: isVisible,
    );
