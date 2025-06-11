import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_options/bottom_options_widget.dart';
import '/components/club_picker_sheet_widget.dart';
import '/components/connection_picker_sheet_widget.dart';
import '/components/course_picker_sheet_widget.dart';
import '/components/date_picker_sheet_widget.dart';
import '/components/drop_down_button_widget.dart';
import '/components/format_picker_sheet_widget.dart';
import '/components/holes_picker_sheet_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/player_selected_widget.dart';
import '/components/time_picker_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'create_round_model.dart';
export 'create_round_model.dart';

class CreateRoundWidget extends StatefulWidget {
  const CreateRoundWidget({
    super.key,
    this.initialRoundDetails,
    this.intialPlayers,
    this.initialPlayerIds,
    this.createdChatId,
  });

  final RoundStruct? initialRoundDetails;
  final List<UsersRow>? intialPlayers;
  final List<String>? initialPlayerIds;
  final List<String>? createdChatId;

  @override
  State<CreateRoundWidget> createState() => _CreateRoundWidgetState();
}

class _CreateRoundWidgetState extends State<CreateRoundWidget> {
  late CreateRoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRoundModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.initialRoundDetails != null) {
        _model.roundDetails = widget.initialRoundDetails;
        safeSetState(() {});
      }
      if (FFAppState().dateSelected ==
          dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
            0,
            0,
          ))) {
        FFAppState().dateSelected = getCurrentTimestamp;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.pageHeaderModel,
            updateCallback: () => safeSetState(() {}),
            child: PageHeaderWidget(
              backVisible: false,
              titleVisible: true,
              actionVisible: true,
              titleText: 'Create a round',
              actionText: 'Cancel',
              hideLine: false,
              backAction: () async {},
              action: () async {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Round details',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Date',
                        icon: Icon(
                          FFIcons.kproperty1Calendar,
                        ),
                        hint: '',
                        selectedOption: dateTimeFormat(
                            "MMMEd",
                            dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                              _model.roundDetails?.dateUnixSeconds,
                              0,
                            ))),
                        showSelected:
                            (_model.roundDetails?.dateUnixSeconds != null) &&
                                (_model.roundDetails?.dateUnixSeconds != 0),
                        action: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00FFFFFF),
                            barrierColor: Color(0x80000000),
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: DatePickerSheetWidget(
                                  selectDateAction: (date) async {
                                    _model.updateRoundDetailsStruct(
                                      (e) => e
                                        ..dateUnixSeconds =
                                            date.secondsSinceEpoch,
                                    );
                                    _model.updatePage(() {});
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Tee Time',
                        icon: Icon(
                          FFIcons.kproperty1Clock,
                        ),
                        hint: '',
                        selectedOption: _model.roundDetails?.teeTime,
                        showSelected: _model.roundDetails?.teeTime != null &&
                            _model.roundDetails?.teeTime != '',
                        action: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).barrier,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: TimePickerSheetWidget(
                                  selectTimeAction: (timeString) async {
                                    _model.updateRoundDetailsStruct(
                                      (e) => e..teeTime = timeString,
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Club',
                        icon: Icon(
                          FFIcons.kproperty1Golf,
                        ),
                        hint: '',
                        selectedOption: _model.roundDetails?.clubId != null &&
                                _model.roundDetails?.clubId != ''
                            ? _model.roundClub?.clubName
                            : '',
                        showSelected: _model.roundDetails?.clubId != null &&
                            _model.roundDetails?.clubId != '',
                        action: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).barrier,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ClubPickerSheetWidget(
                                  selectClubAction: (club) async {
                                    _model.updateRoundDetailsStruct(
                                      (e) => e
                                        ..clubId = club.id
                                        ..courseId = null,
                                    );
                                    _model.roundClub = club;
                                    _model.roundCourse = null;
                                    _model.updatePage(() {});
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Course',
                        icon: Icon(
                          FFIcons.kproperty1Location,
                          color: _model.roundDetails?.clubId != null &&
                                  _model.roundDetails?.clubId != ''
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                        hint: '',
                        selectedOption: _model.roundDetails?.courseId != null &&
                                _model.roundDetails?.courseId != ''
                            ? _model.roundCourse?.courseName
                            : '',
                        showSelected: _model.roundDetails?.courseId != null &&
                            _model.roundDetails?.courseId != '',
                        action: () async {
                          if (_model.roundDetails?.clubId != null &&
                              _model.roundDetails?.clubId != '') {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CoursePickerSheetWidget(
                                    club: _model.roundClub,
                                    selectCourseAction: (course) async {
                                      _model.updateRoundDetailsStruct(
                                        (e) => e..courseId = course.id,
                                      );
                                      _model.roundCourse = course;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Format',
                        icon: Icon(
                          FFIcons.kproperty1Golf,
                        ),
                        hint: '',
                        selectedOption: functions.convertCamelCaseToTitle(
                            _model.roundDetails?.format?.name),
                        showSelected: _model.roundDetails?.format != null,
                        action: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: FormatPickerSheetWidget(
                                  tapListAction: (format) async {
                                    _model.updateRoundDetailsStruct(
                                      (e) => e..format = format,
                                    );
                                    _model.updatePage(() {});
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.dropDownButtonModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownButtonWidget(
                        fieldTitle: 'Holes',
                        icon: Icon(
                          FFIcons.kproperty1Golf,
                        ),
                        hint: '',
                        selectedOption: _model.roundDetails?.holes == null
                            ? '-'
                            : _model.roundDetails?.holes.toString(),
                        showSelected: _model.roundDetails?.holes != null,
                        action: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: HolesPickerSheetWidget(
                                  selectHolesAction: (holesInt) async {
                                    _model.updateRoundDetailsStruct(
                                      (e) => e..holes = holesInt,
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'Players',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.playerSelectedModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: PlayerSelectedWidget(
                            hideDelete: true,
                            userId: widget.intialPlayers!.firstOrNull!.id,
                            fullName:
                                widget.intialPlayers!.firstOrNull!.fullName!,
                            profileImageUrl: widget
                                .intialPlayers!.firstOrNull!.profileImageUrl!,
                            profileImageBlurHash: widget.intialPlayers!
                                .firstOrNull!.profileImageBlurHash!,
                            closeAction: (userId, connection) async {},
                          ),
                        ),
                        if (_model.selectedConnections.length >= 1)
                          Builder(
                            builder: (context) {
                              final player =
                                  _model.selectedConnections.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(player.length, (playerIndex) {
                                  final playerItem = player[playerIndex];
                                  return PlayerSelectedWidget(
                                    key: Key(
                                        'Keylp0_${playerIndex}_of_${player.length}'),
                                    hideDelete: false,
                                    userId: playerItem.userId,
                                    fullName:
                                        '${playerItem.firstName} ${playerItem.lastName}',
                                    profileImageUrl: playerItem.profileImageUrl,
                                    profileImageBlurHash:
                                        playerItem.profileImageBlurHash,
                                    connection: playerItem,
                                    closeAction: (userId, connection) async {
                                      _model
                                          .removeFromSelectedPlayerIds(userId!);
                                      _model.removeFromSelectedConnections(
                                          connection);
                                      _model.updatePage(() {});

                                      FFAppState().update(() {});
                                    },
                                  );
                                }).divide(SizedBox(height: 16.0)),
                              );
                            },
                          ),
                        if (_model.selectedConnections.length < 3)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor:
                                    FlutterFlowTheme.of(context).barrier,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: ConnectionPickerSheetWidget(
                                        tapListAction: (connection) async {
                                          if (_model.selectedPlayerIds.contains(
                                                  connection.userId) !=
                                              true) {
                                            _model.addToSelectedConnections(
                                                connection);
                                            _model.addToSelectedPlayerIds(
                                                connection.userId);
                                            _model.updatePage(() {});
                                          }
                                          Navigator.pop(context);

                                          FFAppState().update(() {});
                                        },
                                        confirmAction: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 56.0,
                                    child: custom_widgets.DashedBorder(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 56.0,
                                    ),
                                  ),
                                  Container(
                                    height: 56.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kproperty1Plus,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Add player',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Mona Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .addToEnd(SizedBox(height: 48.0)),
                ),
              ),
            ),
          ),
          wrapWithModel(
            model: _model.bottomOptionsModel,
            updateCallback: () => safeSetState(() {}),
            child: BottomOptionsWidget(
              primaryVisible: true,
              secondaryVisible: false,
              tertiaryVisible: false,
              primaryText: 'Create round',
              secondaryText: '',
              primaryAction: () async {
                _model.responseJson =
                    await SupabaseProdGroup.createGolfRoundCall.call(
                  inputJsonJson: CreateRoundRequestStruct(
                    date: _model.roundDetails?.dateUnixSeconds,
                    teeTime: '12:00',
                    clubId: _model.roundDetails?.clubId,
                    courseId: _model.roundDetails?.courseId,
                    createdBy: currentUserUid,
                    format: _model.roundDetails?.format?.name,
                    holes: _model.roundDetails?.holes,
                    teeId: '04383f7b-7797-48c7-86ff-8897fa1d088a',
                    players: _model.selectedPlayerIds,
                  ).toMap(),
                );

                Navigator.pop(context);

                safeSetState(() {});
              },
              secondaryAction: () async {},
              tertiaryAction: () async {},
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 24.0,
            decoration: BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
