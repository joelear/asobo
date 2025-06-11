import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_calendarBlank')) {
        try {
          final serializedData = prefs.getString('ff_calendarBlank') ?? '{}';
          _calendarBlank =
              CalendarStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isOneSignalInit =
          prefs.getBool('ff_isOneSignalInit') ?? _isOneSignalInit;
    });
    _safeInit(() {
      _userRounds = prefs
              .getStringList('ff_userRounds')
              ?.map((x) {
                try {
                  return RoundStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _userRounds;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  CalendarStruct _calendarBlank = CalendarStruct();
  CalendarStruct get calendarBlank => _calendarBlank;
  set calendarBlank(CalendarStruct value) {
    _calendarBlank = value;
    prefs.setString('ff_calendarBlank', value.serialize());
  }

  void updateCalendarBlankStruct(Function(CalendarStruct) updateFn) {
    updateFn(_calendarBlank);
    prefs.setString('ff_calendarBlank', _calendarBlank.serialize());
  }

  DateTime? _dateSelected = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? get dateSelected => _dateSelected;
  set dateSelected(DateTime? value) {
    _dateSelected = value;
  }

  DateTime? _messagesLastSync =
      DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get messagesLastSync => _messagesLastSync;
  set messagesLastSync(DateTime? value) {
    _messagesLastSync = value;
  }

  int _newMessagesIndex = 0;
  int get newMessagesIndex => _newMessagesIndex;
  set newMessagesIndex(int value) {
    _newMessagesIndex = value;
  }

  DateTime? _messagesFetchTime =
      DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get messagesFetchTime => _messagesFetchTime;
  set messagesFetchTime(DateTime? value) {
    _messagesFetchTime = value;
  }

  DateTime? _chatsLastSync = DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get chatsLastSync => _chatsLastSync;
  set chatsLastSync(DateTime? value) {
    _chatsLastSync = value;
  }

  DateTime? _fetchTime = DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get fetchTime => _fetchTime;
  set fetchTime(DateTime? value) {
    _fetchTime = value;
  }

  int _syncIndex = 0;
  int get syncIndex => _syncIndex;
  set syncIndex(int value) {
    _syncIndex = value;
  }

  bool _newChatsAvailable = true;
  bool get newChatsAvailable => _newChatsAvailable;
  set newChatsAvailable(bool value) {
    _newChatsAvailable = value;
  }

  bool _newMessagesAvailable = true;
  bool get newMessagesAvailable => _newMessagesAvailable;
  set newMessagesAvailable(bool value) {
    _newMessagesAvailable = value;
  }

  DateTime? _usersLastSynced =
      DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get usersLastSynced => _usersLastSynced;
  set usersLastSynced(DateTime? value) {
    _usersLastSynced = value;
  }

  DateTime? _chatParticipantsLastSynced =
      DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get chatParticipantsLastSynced => _chatParticipantsLastSynced;
  set chatParticipantsLastSynced(DateTime? value) {
    _chatParticipantsLastSynced = value;
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
  }

  String _errorStackTrace = '';
  String get errorStackTrace => _errorStackTrace;
  set errorStackTrace(String value) {
    _errorStackTrace = value;
  }

  bool _hasError = false;
  bool get hasError => _hasError;
  set hasError(bool value) {
    _hasError = value;
  }

  String _fcmToken = 'noToken';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  bool _isOneSignalInit = false;
  bool get isOneSignalInit => _isOneSignalInit;
  set isOneSignalInit(bool value) {
    _isOneSignalInit = value;
    prefs.setBool('ff_isOneSignalInit', value);
  }

  List<String> _roundFormats = [
    'Stroke Play',
    'Stableford',
    'Match Play',
    'Fourball',
    'Scramble'
  ];
  List<String> get roundFormats => _roundFormats;
  set roundFormats(List<String> value) {
    _roundFormats = value;
  }

  void addToRoundFormats(String value) {
    roundFormats.add(value);
  }

  void removeFromRoundFormats(String value) {
    roundFormats.remove(value);
  }

  void removeAtIndexFromRoundFormats(int index) {
    roundFormats.removeAt(index);
  }

  void updateRoundFormatsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    roundFormats[index] = updateFn(_roundFormats[index]);
  }

  void insertAtIndexInRoundFormats(int index, String value) {
    roundFormats.insert(index, value);
  }

  List<int> _holesOptions = [18, 9];
  List<int> get holesOptions => _holesOptions;
  set holesOptions(List<int> value) {
    _holesOptions = value;
  }

  void addToHolesOptions(int value) {
    holesOptions.add(value);
  }

  void removeFromHolesOptions(int value) {
    holesOptions.remove(value);
  }

  void removeAtIndexFromHolesOptions(int index) {
    holesOptions.removeAt(index);
  }

  void updateHolesOptionsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    holesOptions[index] = updateFn(_holesOptions[index]);
  }

  void insertAtIndexInHolesOptions(int index, int value) {
    holesOptions.insert(index, value);
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String value) {
    _selectedTime = value;
  }

  List<RoundStruct> _userRounds = [
    RoundStruct.fromSerializableMap(jsonDecode(
        '{\"round_id\":\"Hello World\",\"club_id\":\"Hello World\",\"course_id\":\"Hello World\",\"date_unix_seconds\":\"0\",\"tee_time\":\"Hello World\",\"format\":\"strokePlay\",\"status\":\"Hello World\",\"holes\":\"0\",\"created_at_unix_seconds\":\"0\",\"created_by\":\"Hello World\",\"participants\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\"}'))
  ];
  List<RoundStruct> get userRounds => _userRounds;
  set userRounds(List<RoundStruct> value) {
    _userRounds = value;
    prefs.setStringList(
        'ff_userRounds', value.map((x) => x.serialize()).toList());
  }

  void addToUserRounds(RoundStruct value) {
    userRounds.add(value);
    prefs.setStringList(
        'ff_userRounds', _userRounds.map((x) => x.serialize()).toList());
  }

  void removeFromUserRounds(RoundStruct value) {
    userRounds.remove(value);
    prefs.setStringList(
        'ff_userRounds', _userRounds.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserRounds(int index) {
    userRounds.removeAt(index);
    prefs.setStringList(
        'ff_userRounds', _userRounds.map((x) => x.serialize()).toList());
  }

  void updateUserRoundsAtIndex(
    int index,
    RoundStruct Function(RoundStruct) updateFn,
  ) {
    userRounds[index] = updateFn(_userRounds[index]);
    prefs.setStringList(
        'ff_userRounds', _userRounds.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserRounds(int index, RoundStruct value) {
    userRounds.insert(index, value);
    prefs.setStringList(
        'ff_userRounds', _userRounds.map((x) => x.serialize()).toList());
  }

  final _getSuggestedConnectionsManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getSuggestedConnections({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getSuggestedConnectionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetSuggestedConnectionsCache() =>
      _getSuggestedConnectionsManager.clear();
  void clearGetSuggestedConnectionsCacheKey(String? uniqueKey) =>
      _getSuggestedConnectionsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
