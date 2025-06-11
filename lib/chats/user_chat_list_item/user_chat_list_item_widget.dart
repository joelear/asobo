import '/backend/schema/enums/enums.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_chat_list_item_model.dart';
export 'user_chat_list_item_model.dart';

class UserChatListItemWidget extends StatefulWidget {
  const UserChatListItemWidget({
    super.key,
    required this.chatId,
    required this.imageUrl,
    required this.imageBlurHash,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.chatName,
    this.callbackAction,
    required this.unReadMessages,
  });

  final String? chatId;
  final String? imageUrl;
  final String? imageBlurHash;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final String? chatName;
  final Future Function(String? chatId)? callbackAction;
  final int? unReadMessages;

  @override
  State<UserChatListItemWidget> createState() => _UserChatListItemWidgetState();
}

class _UserChatListItemWidgetState extends State<UserChatListItemWidget> {
  late UserChatListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserChatListItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 50),
        callback: (timer) async {
          if (_model.tapped) {
            await Future.delayed(const Duration(milliseconds: 100));
            _model.tapped = false;
            safeSetState(() {});
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await widget.callbackAction?.call(
          widget.chatId,
        );
        _model.tapped = false;
        safeSetState(() {});
      },
      onTapDown: (details) async {
        _model.tapped = true;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 500));
        _model.tapped = false;
        safeSetState(() {});
      },
      onTapUp: (details) async {
        _model.tapped = false;
        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  _model.tapped
                      ? FlutterFlowTheme.of(context).alternate
                      : FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.profileImageModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ProfileImageWidget(
                        imageUrl: widget.imageUrl,
                        imageBlurHash: widget.imageBlurHash,
                        size: CircleImageSize.large64,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 65.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.chatName,
                                      'Chat name',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Mona Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.relativeTimeOrDateFromDateTime(
                                          widget.lastMessageTime!),
                                      '12:00',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mona Sans',
                                          color: widget.unReadMessages == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .foreground3
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.lastMessage,
                                        '(No message)',
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mona Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  if (widget.unReadMessages! > 0)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 1.0, 6.0, 1.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.unReadMessages?.toString(),
                                            '2',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
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
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(92.0, 0.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
