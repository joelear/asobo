import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_trigger_widget.dart';
import '/components/club_list_item_small_widget.dart';
import '/components/header_search_bar_widget.dart';
import '/components/list_button_widget.dart';
import '/components/tab_pill_widget.dart';
import '/components/user_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  static String routeName = 'explore';
  static String routePath = '/explore';

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pendingConnections = await ConnectionsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'recipient_user_id',
              currentUserUid,
            )
            .eqOrNull(
              'status',
              ConnectionStatus.pending.name,
            ),
      );
      _model.pendingRequests = _model.pendingConnections?.length;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.headerSearchBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderSearchBarWidget(
                            callbackActionOnChange: () async {
                              safeSetState(
                                  () => _model.requestCompleter1 = null);
                              await _model.waitForRequestCompleted1();
                              safeSetState(
                                  () => _model.requestCompleter2 = null);
                              await _model.waitForRequestCompleted2();
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).line1,
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedTab =
                                            ExplorePageTabs.Network;
                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.tabPillModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TabPillWidget(
                                          selected: _model.selectedTab ==
                                              ExplorePageTabs.Network,
                                          text: 'Network',
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedTab =
                                            ExplorePageTabs.Clubs;
                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.tabPillModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TabPillWidget(
                                          selected: _model.selectedTab ==
                                              ExplorePageTabs.Clubs,
                                          text: 'Clubs',
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).line1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.headerSearchBarModel.textController
                                            .text ==
                                        '')
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (!(_model
                                                    .headerSearchBarModel
                                                    .textFieldFocusNode
                                                    ?.hasFocus ??
                                                false) &&
                                            (_model.selectedTab ==
                                                ExplorePageTabs.Network))
                                          wrapWithModel(
                                            model: _model.listButtonModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ListButtonWidget(
                                              icon: Icon(
                                                FFIcons.kproperty1Profile,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              primaryText: 'Your contacts',
                                              secondaryText: () {
                                                if (_model.pendingRequests ==
                                                    1) {
                                                  return '1 new request';
                                                } else if (_model
                                                        .pendingRequests! >
                                                    1) {
                                                  return '${_model.pendingRequests?.toString()} requests';
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              action: () async {
                                                context.pushNamed(
                                                    ContactWidget.routeName);
                                              },
                                            ),
                                          ),
                                        if (_model.selectedTab ==
                                            ExplorePageTabs.Clubs)
                                          FutureBuilder<List<ClubsRow>>(
                                            future: _model.getClubs(
                                              requestFn: () =>
                                                  ClubsTable().queryRows(
                                                queryFn: (q) => q,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 48.0,
                                                                0.0, 0.0),
                                                    child: SizedBox(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      child:
                                                          SpinKitSquareCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ClubsRow>
                                                  clubsListClubsRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    clubsListClubsRowList
                                                        .length,
                                                    (clubsListIndex) {
                                                  final clubsListClubsRow =
                                                      clubsListClubsRowList[
                                                          clubsListIndex];
                                                  return ClubListItemSmallWidget(
                                                    key: Key(
                                                        'Keyfbr_${clubsListIndex}_of_${clubsListClubsRowList.length}'),
                                                    club: clubsListClubsRow,
                                                    action: () async {
                                                      context.pushNamed(
                                                        ClubWidget.routeName,
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            clubsListClubsRow
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        if (_model.selectedTab ==
                                            ExplorePageTabs.Network)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Suggested contacts',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.1,
                                                      ),
                                                ),
                                              ),
                                              FutureBuilder<ApiCallResponse>(
                                                future: FFAppState()
                                                    .getSuggestedConnections(
                                                  requestFn: () => SupabaseProdGroup
                                                      .getRecommendedConnectionsCall
                                                      .call(
                                                    uuid: currentUserUid,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    48.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SizedBox(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          child:
                                                              SpinKitSquareCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final suggestedContactsGetRecommendedConnectionsResponse =
                                                      snapshot.data!;

                                                  return Builder(
                                                    builder: (context) {
                                                      final suggestedConnection =
                                                          (suggestedContactsGetRecommendedConnectionsResponse
                                                                      .jsonBody
                                                                      .toList()
                                                                      .map<UserConnectionStruct?>(
                                                                          UserConnectionStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<UserConnectionStruct?>)
                                                                  .withoutNulls
                                                                  .toList() ??
                                                              [];

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            suggestedConnection
                                                                .length,
                                                            (suggestedConnectionIndex) {
                                                          final suggestedConnectionItem =
                                                              suggestedConnection[
                                                                  suggestedConnectionIndex];
                                                          return UserListItemWidget(
                                                            key: Key(
                                                                'Keyeh3_${suggestedConnectionIndex}_of_${suggestedConnection.length}'),
                                                            checkBox: false,
                                                            selected: false,
                                                            userConnectionRow:
                                                                suggestedConnectionItem,
                                                            type:
                                                                UserListItemType
                                                                    .connection,
                                                            tapActionUser:
                                                                (userRow) async {
                                                              context.pushNamed(
                                                                ProfileWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'profileImageUrl':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .profileImageUrl,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userId':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .userId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'firstName':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .firstName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'lastName':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .lastName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'locationHomeCity':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .location,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'profileImageBlurHash':
                                                                      serializeParam(
                                                                    suggestedConnectionItem
                                                                        .profileImageBlurHash,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            tapActionConnection:
                                                                (connection) async {},
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ]
                                                .divide(SizedBox(height: 12.0))
                                                .addToStart(
                                                    SizedBox(height: 16.0)),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (_model.headerSearchBarModel.textController
                                            .text !=
                                        '')
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.selectedTab ==
                                            ExplorePageTabs.Clubs)
                                          FutureBuilder<List<ClubsRow>>(
                                            future: (_model
                                                        .requestCompleter1 ??=
                                                    Completer<List<ClubsRow>>()
                                                      ..complete(ClubsTable()
                                                          .queryRows(
                                                        queryFn: (q) => q.ilike(
                                                          'club_name',
                                                          (String var1) {
                                                            return '%' +
                                                                var1 +
                                                                '%';
                                                          }(_model
                                                              .headerSearchBarModel
                                                              .textController
                                                              .text),
                                                        ),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 48.0,
                                                                0.0, 0.0),
                                                    child: SizedBox(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      child:
                                                          SpinKitSquareCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ClubsRow>
                                                  searchClubsClubsRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    searchClubsClubsRowList
                                                        .length,
                                                    (searchClubsIndex) {
                                                  final searchClubsClubsRow =
                                                      searchClubsClubsRowList[
                                                          searchClubsIndex];
                                                  return ClubListItemSmallWidget(
                                                    key: Key(
                                                        'Keygw2_${searchClubsIndex}_of_${searchClubsClubsRowList.length}'),
                                                    club: searchClubsClubsRow,
                                                    action: () async {
                                                      context.pushNamed(
                                                        ClubWidget.routeName,
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            searchClubsClubsRow
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        if (_model.selectedTab ==
                                            ExplorePageTabs.Network)
                                          FutureBuilder<List<UsersRow>>(
                                            future: (_model
                                                        .requestCompleter2 ??=
                                                    Completer<List<UsersRow>>()
                                                      ..complete(UsersTable()
                                                          .queryRows(
                                                        queryFn: (q) => q.ilike(
                                                          'full_name',
                                                          (String var1) {
                                                            return '%' +
                                                                var1 +
                                                                '%';
                                                          }(_model
                                                              .headerSearchBarModel
                                                              .textController
                                                              .text),
                                                        ),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 48.0,
                                                                0.0, 0.0),
                                                    child: SizedBox(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      child:
                                                          SpinKitSquareCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRow>
                                                  searchClubsUsersRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    searchClubsUsersRowList
                                                        .length,
                                                    (searchClubsIndex) {
                                                  final searchClubsUsersRow =
                                                      searchClubsUsersRowList[
                                                          searchClubsIndex];
                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(),
                                                    child: FutureBuilder<
                                                        List<UsersRow>>(
                                                      future: UsersTable()
                                                          .queryRows(
                                                        queryFn: (q) => q
                                                            .ilike(
                                                              'first_last_username',
                                                              (String var1) {
                                                                return '%' +
                                                                    var1 +
                                                                    '%';
                                                              }(_model
                                                                  .headerSearchBarModel
                                                                  .textController
                                                                  .text),
                                                            )
                                                            .neqOrNull(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                        limit: 50,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 24.0,
                                                              height: 24.0,
                                                              child:
                                                                  SpinKitSquareCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRow>
                                                            usersFitleredUsersRowList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            8.0,
                                                            0,
                                                            120.0,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              usersFitleredUsersRowList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              usersFitleredIndex) {
                                                            final usersFitleredUsersRow =
                                                                usersFitleredUsersRowList[
                                                                    usersFitleredIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ProfileWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'profileImageUrl':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .profileImageUrl,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'userId':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'firstName':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .firstName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'lastName':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .lastName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'locationHomeCity':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .locationHomeCity,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'profileImageBlurHash':
                                                                        serializeParam(
                                                                      usersFitleredUsersRow
                                                                          .profileImageBlurHash,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child:
                                                                  UserListItemWidget(
                                                                key: Key(
                                                                    'Keysje_${usersFitleredIndex}_of_${usersFitleredUsersRowList.length}'),
                                                                userRow:
                                                                    usersFitleredUsersRow,
                                                                checkBox: false,
                                                                selected: false,
                                                                type:
                                                                    UserListItemType
                                                                        .user,
                                                                tapActionUser:
                                                                    (userRow) async {},
                                                                tapActionConnection:
                                                                    (connection) async {},
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.chatTriggerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ChatTriggerWidget(),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 88.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
