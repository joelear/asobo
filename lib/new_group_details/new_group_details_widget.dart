import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages_main/profile_image_uploader/profile_image_uploader_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'new_group_details_model.dart';
export 'new_group_details_model.dart';

class NewGroupDetailsWidget extends StatefulWidget {
  const NewGroupDetailsWidget({
    super.key,
    required this.selectedContacts,
  });

  final List<UserConnectionStruct>? selectedContacts;

  static String routeName = 'newGroupDetails';
  static String routePath = '/newGroupDetails';

  @override
  State<NewGroupDetailsWidget> createState() => _NewGroupDetailsWidgetState();
}

class _NewGroupDetailsWidgetState extends State<NewGroupDetailsWidget> {
  late NewGroupDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewGroupDetailsModel());

    _model.groupNameTextController ??= TextEditingController();
    _model.groupNameFocusNode ??= FocusNode();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.pageHeaderModel,
                updateCallback: () => safeSetState(() {}),
                child: PageHeaderWidget(
                  backVisible: true,
                  titleVisible: true,
                  actionVisible: true,
                  titleText: 'Group details',
                  actionText: 'Create group',
                  backAction: () async {
                    context.safePop();
                  },
                  action: () async {
                    _model.newGroupOutput =
                        await SupabaseProdGroup.createGroupChatCall.call(
                      chatCreator: currentUserUid,
                      chatInviteesList: widget.selectedContacts
                          ?.map((e) => e.userId)
                          .toList(),
                      groupName: _model.groupNameTextController.text,
                      groupImageUrl: _model.groupImageUploaderModel
                          .uploadedFileUrl_profileImageUpload,
                      groupImageBlurHash: _model.groupImageUploaderModel
                          .uploadedLocalFile_profileImageUpload.blurHash,
                    );

                    if ((_model.newGroupOutput?.succeeded ?? true)) {
                      await action_blocks.fetchChatParticipants(context);
                      await action_blocks.fetchNewUsers(context);
                      await action_blocks.fetchNewChats(context);
                      await action_blocks.fetchNewMessages(context);
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        ChatWidget.routeName,
                        queryParameters: {
                          'chatId': serializeParam(
                            NewGroupChatResponseStruct.maybeFromMap(
                                    (_model.newGroupOutput?.jsonBody ?? ''))
                                ?.chatId,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    }

                    safeSetState(() {});
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Text(
                                  'Group name',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.groupNameTextController,
                                focusNode: _model.groupNameFocusNode,
                                autofocus: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  alignLabelWithHint: false,
                                  hintText: 'Enter group name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .foreground3,
                                        letterSpacing: 0.0,
                                      ),
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
                                          FlutterFlowTheme.of(context).primary,
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
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.name,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .groupNameTextControllerValidator
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
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Text(
                                  'Group image',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.groupImageUploaderModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ProfileImageUploaderWidget(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
