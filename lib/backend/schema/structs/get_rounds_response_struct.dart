// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetRoundsResponseStruct extends BaseStruct {
  GetRoundsResponseStruct({
    bool? success,
    List<RoundStruct>? rounds,
  })  : _success = success,
        _rounds = rounds;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "rounds" field.
  List<RoundStruct>? _rounds;
  List<RoundStruct> get rounds => _rounds ?? const [];
  set rounds(List<RoundStruct>? val) => _rounds = val;

  void updateRounds(Function(List<RoundStruct>) updateFn) {
    updateFn(_rounds ??= []);
  }

  bool hasRounds() => _rounds != null;

  static GetRoundsResponseStruct fromMap(Map<String, dynamic> data) =>
      GetRoundsResponseStruct(
        success: data['success'] as bool?,
        rounds: getStructList(
          data['rounds'],
          RoundStruct.fromMap,
        ),
      );

  static GetRoundsResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? GetRoundsResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'rounds': _rounds?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'rounds': serializeParam(
          _rounds,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GetRoundsResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetRoundsResponseStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        rounds: deserializeStructParam<RoundStruct>(
          data['rounds'],
          ParamType.DataStruct,
          true,
          structBuilder: RoundStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GetRoundsResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GetRoundsResponseStruct &&
        success == other.success &&
        listEquality.equals(rounds, other.rounds);
  }

  @override
  int get hashCode => const ListEquality().hash([success, rounds]);
}

GetRoundsResponseStruct createGetRoundsResponseStruct({
  bool? success,
}) =>
    GetRoundsResponseStruct(
      success: success,
    );
