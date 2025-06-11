import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({
    super.key,
    required this.notification,
  });

  final NotificationsRow? notification;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConnectionsRow>>(
      future: (_model.requestCompleter ??= Completer<List<ConnectionsRow>>()
            ..complete(ConnectionsTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.notification?.connectionId,
              ),
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
        List<ConnectionsRow> notificationContainerConnectionsRowList =
            snapshot.data!;

        final notificationContainerConnectionsRow =
            notificationContainerConnectionsRowList.isNotEmpty
                ? notificationContainerConnectionsRowList.first
                : null;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: widget.notification!.isRead
                ? FlutterFlowTheme.of(context).primaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                notificationContainerConnectionsRow?.senderUserId,
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
              List<UsersRow> containerUsersRowList = snapshot.data!;

              final containerUsersRow = containerUsersRowList.isNotEmpty
                  ? containerUsersRowList.first
                  : null;

              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    ProfileWidget.routeName,
                    queryParameters: {
                      'profileImageUrl': serializeParam(
                        containerUsersRow?.profileImageUrl,
                        ParamType.String,
                      ),
                      'userId': serializeParam(
                        containerUsersRow?.id,
                        ParamType.String,
                      ),
                      'firstName': serializeParam(
                        containerUsersRow?.firstName,
                        ParamType.String,
                      ),
                      'lastName': serializeParam(
                        containerUsersRow?.lastName,
                        ParamType.String,
                      ),
                      'locationHomeCity': serializeParam(
                        containerUsersRow?.locationHomeCity,
                        ParamType.String,
                      ),
                      'profileImageBlurHash': serializeParam(
                        containerUsersRow?.profileImageBlurHash,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.profileImageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ProfileImageWidget(
                            imageUrl: widget.notification?.imageUrl,
                            imageBlurHash: widget.notification?.imageBlurHash,
                            size: CircleImageSize.medium48,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${widget.notification?.sourceName} would like to connect',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mona Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (notificationContainerConnectionsRow?.status ==
                            ConnectionStatus.pending.name)
                          FFButtonWidget(
                            onPressed: () async {
                              await ConnectionsTable().update(
                                data: {
                                  'status': ConnectionStatus.accepted.name,
                                },
                                matchingRows: (rows) => rows.eqOrNull(
                                  'id',
                                  notificationContainerConnectionsRow?.id,
                                ),
                              );
                              safeSetState(
                                  () => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                            text: 'Accept',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).line1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Mona Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        if (notificationContainerConnectionsRow?.status ==
                            ConnectionStatus.accepted.name)
                          Container(
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).line1,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  'Accepted',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .foreground3,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
