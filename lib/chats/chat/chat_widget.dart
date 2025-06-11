import '/auth/supabase_auth/auth_util.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/backend/supabase/supabase.dart';
import '/chats/message_me/message_me_widget.dart';
import '/chats/message_other/message_other_widget.dart';
import '/components/bottom_sheet_options_widget.dart';
import '/components/chat_header/chat_header_widget.dart';
import '/components/chat_trigger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.chatId,
  });

  final String? chatId;

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatDetails = await SQLiteManager.instance.getChat(
        chatId: widget.chatId!,
      );
      await SQLiteManager.instance.readAllMessagesInChat(
        chatId: widget.chatId!,
      );
      _model.chatImage = _model.chatDetails?.firstOrNull?.chatImageUrl;
      _model.chatName = _model.chatDetails?.firstOrNull?.chatName;
      _model.chatBlurHash = _model.chatDetails?.firstOrNull?.chatName;
      _model.isGroup = _model.chatDetails?.firstOrNull?.isGroup == 1;
      safeSetState(() {});
      FFAppState().newChatsAvailable = true;
      FFAppState().newMessagesAvailable = true;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().newChatsAvailable) {
            await action_blocks.fetchNewChats(context);
            safeSetState(() {});
            await action_blocks.fetchNewUsers(context);
            await action_blocks.fetchChatParticipants(context);

            FFAppState().update(() {});
            FFAppState().newChatsAvailable = false;
            safeSetState(() {});
          } else if (FFAppState().newMessagesAvailable) {
            await action_blocks.fetchNewMessages(context);
            await SQLiteManager.instance.readAllMessagesInChat(
              chatId: widget.chatId!,
            );

            FFAppState().update(() {});
            FFAppState().newMessagesAvailable = false;
            safeSetState(() {});
          }
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController(text: _model.draftMessage);
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.chatName != null && _model.chatName != '')
                wrapWithModel(
                  model: _model.chatHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ChatHeaderWidget(
                    chatId: widget.chatId!,
                    chatName: _model.chatName!,
                    chatBlurHash: _model.chatBlurHash!,
                    chatImage: _model.chatImage!,
                  ),
                ),
              Expanded(
                child: FutureBuilder<List<GetAllUsersRow>>(
                  future: SQLiteManager.instance.getAllUsers(),
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
                    final getUsersGetAllUsersRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<GetAllMessagesInChatRow>>(
                        future: SQLiteManager.instance.getAllMessagesInChat(
                          chatId: widget.chatId!,
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
                          final messagesGetAllMessagesInChatRowList =
                              snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Builder(
                                builder: (context) {
                                  final messages =
                                      messagesGetAllMessagesInChatRowList
                                          .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    reverse: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: messages.length,
                                    itemBuilder: (context, messagesIndex) {
                                      final messagesItem =
                                          messages[messagesIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (messagesGetAllMessagesInChatRowList
                                                      .length ==
                                                  valueOrDefault<int>(
                                                    messagesIndex + 1,
                                                    0,
                                                  )
                                              ? true
                                              : !functions.sameDay(
                                                  messagesItem.createdAt,
                                                  messagesGetAllMessagesInChatRowList
                                                      .elementAtOrNull(
                                                          messagesIndex + 1)
                                                      ?.createdAt))
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 4.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .relativeDateFromUni(
                                                            messagesItem
                                                                .createdAt),
                                                    'Date',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mona Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          if (messagesItem.senderId !=
                                              currentUserUid)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: MessageOtherWidget(
                                                    key: Key(
                                                        'Keyv8c_${messagesIndex}_of_${messages.length}'),
                                                    text: messagesItem
                                                        .messageText,
                                                    senderFullName:
                                                        '${valueOrDefault<String>(
                                                      getUsersGetAllUsersRowList
                                                          .where((e) =>
                                                              e.userId ==
                                                              valueOrDefault<
                                                                  String>(
                                                                messagesItem
                                                                    .senderId,
                                                                '1',
                                                              ))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.firstName,
                                                      'First Last Name',
                                                    )} ${valueOrDefault<String>(
                                                      getUsersGetAllUsersRowList
                                                          .where((e) =>
                                                              e.userId ==
                                                              valueOrDefault<
                                                                  String>(
                                                                messagesItem
                                                                    .senderId,
                                                                '1',
                                                              ))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.lastName,
                                                      'First Last Name',
                                                    )}',
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      getUsersGetAllUsersRowList
                                                          .where((e) =>
                                                              e.userId ==
                                                              valueOrDefault<
                                                                  String>(
                                                                messagesItem
                                                                    .senderId,
                                                                '1',
                                                              ))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.profileImageUrl,
                                                      'First Last Name',
                                                    ),
                                                    imageBlurHash:
                                                        valueOrDefault<String>(
                                                      getUsersGetAllUsersRowList
                                                          .where((e) =>
                                                              e.userId ==
                                                              valueOrDefault<
                                                                  String>(
                                                                messagesItem
                                                                    .senderId,
                                                                '1',
                                                              ))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.profileImageBlurHash,
                                                      'First Last Name',
                                                    ),
                                                    isGroup: _model.isGroup,
                                                    showNameAndPic: () {
                                                      if (messagesGetAllMessagesInChatRowList
                                                              .length ==
                                                          valueOrDefault<int>(
                                                            messagesIndex + 1,
                                                            0,
                                                          )) {
                                                        return true;
                                                      } else if (functions.sameDay(
                                                              messagesItem
                                                                  .createdAt,
                                                              messagesGetAllMessagesInChatRowList
                                                                  .elementAtOrNull(
                                                                      messagesIndex +
                                                                          1)
                                                                  ?.createdAt) &&
                                                          (messagesGetAllMessagesInChatRowList
                                                                  .elementAtOrNull(
                                                                      messagesIndex +
                                                                          1)
                                                                  ?.senderId ==
                                                              messagesItem
                                                                  .senderId)) {
                                                        return false;
                                                      } else {
                                                        return true;
                                                      }
                                                    }(),
                                                    time: DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            messagesItem
                                                                .createdAt),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible:
                                                    messagesItem.senderId ==
                                                        currentUserUid,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: MessageMeWidget(
                                                    key: Key(
                                                        'Keyw2s_${messagesIndex}_of_${messages.length}'),
                                                    text: messagesItem
                                                        .messageText,
                                                    time: DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            messagesItem
                                                                .createdAt),
                                                    singleMessage: () {
                                                      if (messagesGetAllMessagesInChatRowList
                                                              .length ==
                                                          valueOrDefault<int>(
                                                            messagesIndex + 1,
                                                            0,
                                                          )) {
                                                        return true;
                                                      } else if (functions.sameDay(
                                                              messagesItem
                                                                  .createdAt,
                                                              messagesGetAllMessagesInChatRowList
                                                                  .elementAtOrNull(
                                                                      messagesIndex +
                                                                          1)
                                                                  ?.createdAt) &&
                                                          (messagesGetAllMessagesInChatRowList
                                                                  .elementAtOrNull(
                                                                      messagesIndex +
                                                                          1)
                                                                  ?.senderId ==
                                                              messagesItem
                                                                  .senderId)) {
                                                        return false;
                                                      } else {
                                                        return true;
                                                      }
                                                    }(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.3,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    wrapWithModel(
                      model: _model.chatTriggerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ChatTriggerWidget(),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0x3F000000),
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: 156.0,
                                        child: BottomSheetOptionsWidget(
                                          showButton1: true,
                                          showButton2: false,
                                          showButton3: false,
                                          button1Icon: Icon(
                                            FFIcons.kproperty1Add,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          button1Text: 'Create round',
                                          button1Action: () async {},
                                          button2Action: () async {},
                                          button3Action: () async {},
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 56.0,
                              height: 40.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Icon(
                                  FFIcons.kproperty1Add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    await SQLiteManager.instance
                                        .updateDraftMessage(
                                      chatId: widget.chatId!,
                                      draftMessage: _model.textController.text,
                                    );
                                  },
                                ),
                                onFieldSubmitted: (_) async {
                                  if (_model.textController.text != '') {
                                    await actions.forceTextFocus(
                                      context,
                                    );
                                    _model.supabaseInsertMessage =
                                        await MessagesTable().insert({
                                      'chat_id': widget.chatId,
                                      'sender_id': currentUserUid,
                                      'text': _model.textController.text,
                                    });
                                    await SQLiteManager.instance.insertMessage(
                                      messageId: _model
                                          .supabaseInsertMessage!.id
                                          .toString(),
                                      chatId:
                                          _model.supabaseInsertMessage!.chatId!,
                                      senderId: _model
                                          .supabaseInsertMessage!.senderId!,
                                      messageText:
                                          _model.supabaseInsertMessage!.text!,
                                      isSent: 1,
                                      createdAt: _model.supabaseInsertMessage!
                                          .createdAt.millisecondsSinceEpoch,
                                      senderFirstName: 'You',
                                      isRead: 1,
                                    );
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                  }

                                  safeSetState(() {});
                                },
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.send,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 6,
                                minLines: 1,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.sentences),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (!(_model.textFieldFocusNode?.hasFocus ?? false))
                          Container(
                            width: 12.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.textController.text != '') {
                              await actions.forceTextFocus(
                                context,
                              );
                              _model.supabaseInsertMessageButton =
                                  await MessagesTable().insert({
                                'chat_id': widget.chatId,
                                'sender_id': currentUserUid,
                                'text': _model.textController.text,
                              });
                              await SQLiteManager.instance.insertMessage(
                                chatId:
                                    _model.supabaseInsertMessageButton!.chatId!,
                                senderId: currentUserUid,
                                messageText:
                                    _model.supabaseInsertMessageButton!.text!,
                                isSent: 1,
                                createdAt: _model.supabaseInsertMessageButton!
                                    .createdAt.millisecondsSinceEpoch,
                                senderFirstName: 'You',
                                isRead: 1,
                                messageId: _model
                                    .supabaseInsertMessageButton!.id
                                    .toString(),
                              );
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          (_model.textFieldFocusNode
                                                      ?.hasFocus ??
                                                  false)
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Icon(
                                        FFIcons.kproperty1SendFilled,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 18.0,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
