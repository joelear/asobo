// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateRoundRequestStruct extends BaseStruct {
  CreateRoundRequestStruct({
    int? date,
    String? teeTime,
    String? clubId,
    String? courseId,
    String? createdBy,
    String? format,
    int? holes,
    String? teeId,
    List<String>? players,
  })  : _date = date,
        _teeTime = teeTime,
        _clubId = clubId,
        _courseId = courseId,
        _createdBy = createdBy,
        _format = format,
        _holes = holes,
        _teeId = teeId,
        _players = players;

  // "date" field.
  int? _date;
  int get date => _date ?? 0;
  set date(int? val) => _date = val;

  void incrementDate(int amount) => date = date + amount;

  bool hasDate() => _date != null;

  // "tee_time" field.
  String? _teeTime;
  String get teeTime => _teeTime ?? '';
  set teeTime(String? val) => _teeTime = val;

  bool hasTeeTime() => _teeTime != null;

  // "club_id" field.
  String? _clubId;
  String get clubId => _clubId ?? '';
  set clubId(String? val) => _clubId = val;

  bool hasClubId() => _clubId != null;

  // "course_id" field.
  String? _courseId;
  String get courseId => _courseId ?? '';
  set courseId(String? val) => _courseId = val;

  bool hasCourseId() => _courseId != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "format" field.
  String? _format;
  String get format => _format ?? '';
  set format(String? val) => _format = val;

  bool hasFormat() => _format != null;

  // "holes" field.
  int? _holes;
  int get holes => _holes ?? 0;
  set holes(int? val) => _holes = val;

  void incrementHoles(int amount) => holes = holes + amount;

  bool hasHoles() => _holes != null;

  // "tee_id" field.
  String? _teeId;
  String get teeId => _teeId ?? '';
  set teeId(String? val) => _teeId = val;

  bool hasTeeId() => _teeId != null;

  // "players" field.
  List<String>? _players;
  List<String> get players => _players ?? const [];
  set players(List<String>? val) => _players = val;

  void updatePlayers(Function(List<String>) updateFn) {
    updateFn(_players ??= []);
  }

  bool hasPlayers() => _players != null;

  static CreateRoundRequestStruct fromMap(Map<String, dynamic> data) =>
      CreateRoundRequestStruct(
        date: castToType<int>(data['date']),
        teeTime: data['tee_time'] as String?,
        clubId: data['club_id'] as String?,
        courseId: data['course_id'] as String?,
        createdBy: data['created_by'] as String?,
        format: data['format'] as String?,
        holes: castToType<int>(data['holes']),
        teeId: data['tee_id'] as String?,
        players: getDataList(data['players']),
      );

  static CreateRoundRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateRoundRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'tee_time': _teeTime,
        'club_id': _clubId,
        'course_id': _courseId,
        'created_by': _createdBy,
        'format': _format,
        'holes': _holes,
        'tee_id': _teeId,
        'players': _players,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.int,
        ),
        'tee_time': serializeParam(
          _teeTime,
          ParamType.String,
        ),
        'club_id': serializeParam(
          _clubId,
          ParamType.String,
        ),
        'course_id': serializeParam(
          _courseId,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'format': serializeParam(
          _format,
          ParamType.String,
        ),
        'holes': serializeParam(
          _holes,
          ParamType.int,
        ),
        'tee_id': serializeParam(
          _teeId,
          ParamType.String,
        ),
        'players': serializeParam(
          _players,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CreateRoundRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateRoundRequestStruct(
        date: deserializeParam(
          data['date'],
          ParamType.int,
          false,
        ),
        teeTime: deserializeParam(
          data['tee_time'],
          ParamType.String,
          false,
        ),
        clubId: deserializeParam(
          data['club_id'],
          ParamType.String,
          false,
        ),
        courseId: deserializeParam(
          data['course_id'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.String,
          false,
        ),
        format: deserializeParam(
          data['format'],
          ParamType.String,
          false,
        ),
        holes: deserializeParam(
          data['holes'],
          ParamType.int,
          false,
        ),
        teeId: deserializeParam(
          data['tee_id'],
          ParamType.String,
          false,
        ),
        players: deserializeParam<String>(
          data['players'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CreateRoundRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreateRoundRequestStruct &&
        date == other.date &&
        teeTime == other.teeTime &&
        clubId == other.clubId &&
        courseId == other.courseId &&
        createdBy == other.createdBy &&
        format == other.format &&
        holes == other.holes &&
        teeId == other.teeId &&
        listEquality.equals(players, other.players);
  }

  @override
  int get hashCode => const ListEquality().hash([
        date,
        teeTime,
        clubId,
        courseId,
        createdBy,
        format,
        holes,
        teeId,
        players
      ]);
}

CreateRoundRequestStruct createCreateRoundRequestStruct({
  int? date,
  String? teeTime,
  String? clubId,
  String? courseId,
  String? createdBy,
  String? format,
  int? holes,
  String? teeId,
}) =>
    CreateRoundRequestStruct(
      date: date,
      teeTime: teeTime,
      clubId: clubId,
      courseId: courseId,
      createdBy: createdBy,
      format: format,
      holes: holes,
      teeId: teeId,
    );
