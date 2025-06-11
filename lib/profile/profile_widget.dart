import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.profileImageUrl,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.locationHomeCity,
    required this.profileImageBlurHash,
  });

  final String? profileImageUrl;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? locationHomeCity;
  final String? profileImageBlurHash;

  static String routeName = 'profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.userId,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: SpinKitSquareCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
                );
              }
              List<UsersRow> profileContainerUsersRowList = snapshot.data!;

              final profileContainerUsersRow =
                  profileContainerUsersRowList.isNotEmpty
                      ? profileContainerUsersRowList.first
                      : null;

              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(SupabaseProdGroup.getConnectionInfoCall.call(
                          queryingUserId: currentUserUid,
                          targetUserId: widget.userId,
                        )))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: SpinKitSquareCircle(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      );
                    }
                    final connectedContainerGetConnectionInfoResponse =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.pageHeaderModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PageHeaderWidget(
                              backVisible: true,
                              titleVisible: true,
                              actionVisible: false,
                              titleText: 'Profile',
                              backAction: () async {
                                context.safePop();
                              },
                              action: () async {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.profileImageModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ProfileImageWidget(
                                      imageUrl: widget.profileImageUrl,
                                      imageBlurHash:
                                          widget.profileImageBlurHash,
                                      size: CircleImageSize.xxl96,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              valueOrDefault<String>(
                                                '${widget.firstName} ${widget.lastName}',
                                                'Users Name',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.1,
                                                      ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FFIcons.kproperty1Location,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 14.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'London, UK',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Endorsed by',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kproperty1Verifed2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '0',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
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
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Handicap',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '0',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
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
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mutual contacts',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '0',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 1.0),
                                                child: Text(
                                                  'inc. ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((connectedContainerGetConnectionInfoResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<ConnectionInfoStruct?>(
                                                      ConnectionInfoStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  ConnectionInfoStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.connectionExists ==
                                      false)
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.createConnectionOutput =
                                              await ConnectionsTable().insert({
                                            'recipient_user_id': widget.userId,
                                            'sender_user_id': currentUserUid,
                                            'status':
                                                ConnectionStatus.pending.name,
                                          });
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();

                                          safeSetState(() {});
                                        },
                                        text: 'Connect',
                                        icon: Icon(
                                          FFIcons.kproperty1Add,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (((connectedContainerGetConnectionInfoResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<ConnectionInfoStruct?>(
                                                          ConnectionInfoStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ConnectionInfoStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.status ==
                                          ConnectionStatus.pending) &&
                                      ((connectedContainerGetConnectionInfoResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<ConnectionInfoStruct?>(
                                                          ConnectionInfoStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ConnectionInfoStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.senderUserId ==
                                          currentUserUid))
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('pendingButton pressed ...');
                                        },
                                        text: 'Request sent',
                                        icon: Icon(
                                          FFIcons.kproperty1Hourglass,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (((connectedContainerGetConnectionInfoResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<ConnectionInfoStruct?>(
                                                          ConnectionInfoStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ConnectionInfoStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.status ==
                                          ConnectionStatus.pending) &&
                                      ((connectedContainerGetConnectionInfoResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<ConnectionInfoStruct?>(
                                                          ConnectionInfoStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ConnectionInfoStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.recipientUserId ==
                                          currentUserUid))
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await ConnectionsTable().update(
                                            data: {
                                              'status': ConnectionStatus
                                                  .accepted.name,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              (connectedContainerGetConnectionInfoResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<ConnectionInfoStruct?>(
                                                              ConnectionInfoStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          ConnectionInfoStruct?>)
                                                  .withoutNulls
                                                  .firstOrNull
                                                  ?.connectionId,
                                            ),
                                          );
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        text: 'Accept connection request',
                                        icon: Icon(
                                          FFIcons.kproperty1CheckCircle,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if ((connectedContainerGetConnectionInfoResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<ConnectionInfoStruct?>(
                                                      ConnectionInfoStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  ConnectionInfoStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.status ==
                                      ConnectionStatus.accepted)
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('connectedButton pressed ...');
                                        },
                                        text: 'Connected',
                                        icon: Icon(
                                          FFIcons.kproperty1CheckCircle,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if ((connectedContainerGetConnectionInfoResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<ConnectionInfoStruct?>(
                                                      ConnectionInfoStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  ConnectionInfoStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.status ==
                                      ConnectionStatus.accepted)
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await action_blocks
                                              .openNewOrExistingChat(
                                            context,
                                            userToChatWith:
                                                profileContainerUsersRow?.id,
                                          );
                                        },
                                        text: 'Message',
                                        icon: Icon(
                                          FFIcons.kproperty1Message,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
