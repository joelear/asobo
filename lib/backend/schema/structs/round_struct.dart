// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoundStruct extends BaseStruct {
  RoundStruct({
    String? roundId,
    int? dateUnixSeconds,
    String? teeTime,
    String? clubId,
    String? courseId,
    String? createdBy,
    RoundFormat? format,
    int? holes,
    List<RoundParticipantStruct>? participants,
    String? status,
    int? createdAtUnixSeconds,
    String? clubName,
  })  : _roundId = roundId,
        _dateUnixSeconds = dateUnixSeconds,
        _teeTime = teeTime,
        _clubId = clubId,
        _courseId = courseId,
        _createdBy = createdBy,
        _format = format,
        _holes = holes,
        _participants = participants,
        _status = status,
        _createdAtUnixSeconds = createdAtUnixSeconds,
        _clubName = clubName;

  // "round_id" field.
  String? _roundId;
  String get roundId => _roundId ?? '';
  set roundId(String? val) => _roundId = val;

  bool hasRoundId() => _roundId != null;

  // "date_unix_seconds" field.
  int? _dateUnixSeconds;
  int get dateUnixSeconds => _dateUnixSeconds ?? 0;
  set dateUnixSeconds(int? val) => _dateUnixSeconds = val;

  void incrementDateUnixSeconds(int amount) =>
      dateUnixSeconds = dateUnixSeconds + amount;

  bool hasDateUnixSeconds() => _dateUnixSeconds != null;

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
  RoundFormat? _format;
  RoundFormat? get format => _format;
  set format(RoundFormat? val) => _format = val;

  bool hasFormat() => _format != null;

  // "holes" field.
  int? _holes;
  int get holes => _holes ?? 0;
  set holes(int? val) => _holes = val;

  void incrementHoles(int amount) => holes = holes + amount;

  bool hasHoles() => _holes != null;

  // "participants" field.
  List<RoundParticipantStruct>? _participants;
  List<RoundParticipantStruct> get participants => _participants ?? const [];
  set participants(List<RoundParticipantStruct>? val) => _participants = val;

  void updateParticipants(Function(List<RoundParticipantStruct>) updateFn) {
    updateFn(_participants ??= []);
  }

  bool hasParticipants() => _participants != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "created_at_unix_seconds" field.
  int? _createdAtUnixSeconds;
  int get createdAtUnixSeconds => _createdAtUnixSeconds ?? 0;
  set createdAtUnixSeconds(int? val) => _createdAtUnixSeconds = val;

  void incrementCreatedAtUnixSeconds(int amount) =>
      createdAtUnixSeconds = createdAtUnixSeconds + amount;

  bool hasCreatedAtUnixSeconds() => _createdAtUnixSeconds != null;

  // "club_name" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  set clubName(String? val) => _clubName = val;

  bool hasClubName() => _clubName != null;

  static RoundStruct fromMap(Map<String, dynamic> data) => RoundStruct(
        roundId: data['round_id'] as String?,
        dateUnixSeconds: castToType<int>(data['date_unix_seconds']),
        teeTime: data['tee_time'] as String?,
        clubId: data['club_id'] as String?,
        courseId: data['course_id'] as String?,
        createdBy: data['created_by'] as String?,
        format: data['format'] is RoundFormat
            ? data['format']
            : deserializeEnum<RoundFormat>(data['format']),
        holes: castToType<int>(data['holes']),
        participants: getStructList(
          data['participants'],
          RoundParticipantStruct.fromMap,
        ),
        status: data['status'] as String?,
        createdAtUnixSeconds: castToType<int>(data['created_at_unix_seconds']),
        clubName: data['club_name'] as String?,
      );

  static RoundStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoundStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'round_id': _roundId,
        'date_unix_seconds': _dateUnixSeconds,
        'tee_time': _teeTime,
        'club_id': _clubId,
        'course_id': _courseId,
        'created_by': _createdBy,
        'format': _format?.serialize(),
        'holes': _holes,
        'participants': _participants?.map((e) => e.toMap()).toList(),
        'status': _status,
        'created_at_unix_seconds': _createdAtUnixSeconds,
        'club_name': _clubName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'round_id': serializeParam(
          _roundId,
          ParamType.String,
        ),
        'date_unix_seconds': serializeParam(
          _dateUnixSeconds,
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
          ParamType.Enum,
        ),
        'holes': serializeParam(
          _holes,
          ParamType.int,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'created_at_unix_seconds': serializeParam(
          _createdAtUnixSeconds,
          ParamType.int,
        ),
        'club_name': serializeParam(
          _clubName,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoundStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoundStruct(
        roundId: deserializeParam(
          data['round_id'],
          ParamType.String,
          false,
        ),
        dateUnixSeconds: deserializeParam(
          data['date_unix_seconds'],
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
        format: deserializeParam<RoundFormat>(
          data['format'],
          ParamType.Enum,
          false,
        ),
        holes: deserializeParam(
          data['holes'],
          ParamType.int,
          false,
        ),
        participants: deserializeStructParam<RoundParticipantStruct>(
          data['participants'],
          ParamType.DataStruct,
          true,
          structBuilder: RoundParticipantStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdAtUnixSeconds: deserializeParam(
          data['created_at_unix_seconds'],
          ParamType.int,
          false,
        ),
        clubName: deserializeParam(
          data['club_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RoundStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoundStruct &&
        roundId == other.roundId &&
        dateUnixSeconds == other.dateUnixSeconds &&
        teeTime == other.teeTime &&
        clubId == other.clubId &&
        courseId == other.courseId &&
        createdBy == other.createdBy &&
        format == other.format &&
        holes == other.holes &&
        listEquality.equals(participants, other.participants) &&
        status == other.status &&
        createdAtUnixSeconds == other.createdAtUnixSeconds &&
        clubName == other.clubName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        roundId,
        dateUnixSeconds,
        teeTime,
        clubId,
        courseId,
        createdBy,
        format,
        holes,
        participants,
        status,
        createdAtUnixSeconds,
        clubName
      ]);
}

RoundStruct createRoundStruct({
  String? roundId,
  int? dateUnixSeconds,
  String? teeTime,
  String? clubId,
  String? courseId,
  String? createdBy,
  RoundFormat? format,
  int? holes,
  String? status,
  int? createdAtUnixSeconds,
  String? clubName,
}) =>
    RoundStruct(
      roundId: roundId,
      dateUnixSeconds: dateUnixSeconds,
      teeTime: teeTime,
      clubId: clubId,
      courseId: courseId,
      createdBy: createdBy,
      format: format,
      holes: holes,
      status: status,
      createdAtUnixSeconds: createdAtUnixSeconds,
      clubName: clubName,
    );
