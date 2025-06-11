import '/auth/supabase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/chats/user_chat_list_item/user_chat_list_item_widget.dart';
import '/components/chat_trigger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  static String routeName = 'chats';
  static String routePath = '/chats';

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().newChatsAvailable = true;
      FFAppState().newMessagesAvailable = true;
      safeSetState(() {});
      await action_blocks.initialiseOneSignal(context);
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().newMessagesAvailable) {
            await action_blocks.fetchNewMessages(context);
            safeSetState(() {});
            FFAppState().newMessagesAvailable = false;
            FFAppState().update(() {});
          } else if (FFAppState().newChatsAvailable) {
            await action_blocks.fetchNewChats(context);
            safeSetState(() {});
            await action_blocks.fetchNewUsers(context);
            safeSetState(() {});
            await action_blocks.fetchChatParticipants(context);
            safeSetState(() {});
            FFAppState().newChatsAvailable = false;
            FFAppState().update(() {});
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 88.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 60.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              NewChatWidget.routeName);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Icon(
                                                      FFIcons.kproperty1Add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 60.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              NewChatWidget.routeName);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Icon(
                                                      FFIcons.kproperty1Add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  height: 48.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Chats',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<GetAllChatsRow>>(
                      future: SQLiteManager.instance.getAllChats(),
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
                        final getAllChatsGetAllChatsRowList = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.chatsAvailable)
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                                  .width *
                                              1.0,
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  getAllChatsGetAllChatsRowList
                                                          .where((e) =>
                                                              e.lastMessage !=
                                                                  null &&
                                                              e.lastMessage !=
                                                                  '')
                                                          .toList()
                                                          .length ==
                                                      0,
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                0.0,
                                                                16.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          FFIcons
                                                              .kproperty1Message,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 64.0,
                                                        ),
                                                        Text(
                                                          'Chats',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displayMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mona Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Your chats will appear here. Message 1 to 1 or as a group, share your availability and create rounds.',
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Mona Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed:
                                                              () async {
                                                            context.pushNamed(
                                                                NewChatWidget
                                                                    .routeName);
                                                          },
                                                          text: 'Create chat',
                                                          icon: Icon(
                                                            FFIcons
                                                                .kproperty1Add,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 56.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Mona Sans',
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight.w500,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 16.0))
                                                          .addToStart(
                                                              SizedBox(
                                                                  height:
                                                                      24.0))
                                                          .addToEnd(SizedBox(
                                                              height: 24.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration:
                                                        BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final chatList =
                                                getAllChatsGetAllChatsRowList
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children:
                                                  List.generate(chatList.length,
                                                      (chatListIndex) {
                                                final chatListItem =
                                                    chatList[chatListIndex];
                                                return FutureBuilder<
                                                    List<
                                                        GetAllMessagesInChatRow>>(
                                                  future: SQLiteManager.instance
                                                      .getAllMessagesInChat(
                                                    chatId: chatListItem.chatId,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Image.asset(
                                                        '',
                                                      );
                                                    }
                                                    final containerGetAllMessagesInChatRowList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible: chatListItem
                                                                    .lastMessage !=
                                                                null &&
                                                            chatListItem
                                                                    .lastMessage !=
                                                                '',
                                                        child:
                                                            UserChatListItemWidget(
                                                          key: Key(
                                                              'Keymrm_${chatListIndex}_of_${chatList.length}'),
                                                          chatId: chatListItem
                                                              .chatId,
                                                          imageUrl: chatListItem
                                                              .chatImageUrl!,
                                                          imageBlurHash:
                                                              chatListItem
                                                                  .chatImageBlurHash!,
                                                          lastMessage:
                                                              '${containerGetAllMessagesInChatRowList.firstOrNull?.senderId == currentUserUid ? 'You' : containerGetAllMessagesInChatRowList.firstOrNull?.senderFirstName}: ${containerGetAllMessagesInChatRowList.firstOrNull?.messageText}',
                                                          chatName: chatListItem
                                                              .chatName!,
                                                          lastMessageTime: DateTime
                                                              .fromMillisecondsSinceEpoch(
                                                                  valueOrDefault<
                                                                      int>(
                                                            containerGetAllMessagesInChatRowList
                                                                .firstOrNull
                                                                ?.createdAt,
                                                            0,
                                                          )),
                                                          unReadMessages:
                                                              valueOrDefault<
                                                                  int>(
                                                            containerGetAllMessagesInChatRowList
                                                                .where((e) =>
                                                                    e.isRead ==
                                                                    0)
                                                                .toList()
                                                                .length,
                                                            0,
                                                          ),
                                                          callbackAction:
                                                              (chatId) async {
                                                            context.pushNamed(
                                                              ChatWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'chatId':
                                                                    serializeParam(
                                                                  chatListItem
                                                                      .chatId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.chatTriggerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ChatTriggerWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
