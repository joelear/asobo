import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/user_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'search_users_model.dart';
export 'search_users_model.dart';

class SearchUsersWidget extends StatefulWidget {
  const SearchUsersWidget({
    super.key,
    required this.searchType,
    required this.searchCallbackActionUser,
    this.searchCallbackActionConnection,
    bool? closeVisible,
    this.closeAction,
    bool? autofocus,
  })  : this.closeVisible = closeVisible ?? false,
        this.autofocus = autofocus ?? false;

  final SearchType? searchType;
  final Future Function(UsersRow? userRow)? searchCallbackActionUser;
  final Future Function(UserConnectionStruct? connection)?
      searchCallbackActionConnection;
  final bool closeVisible;
  final Future Function()? closeAction;
  final bool autofocus;

  @override
  State<SearchUsersWidget> createState() => _SearchUsersWidgetState();
}

class _SearchUsersWidgetState extends State<SearchUsersWidget> {
  late SearchUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchUsersModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 300),
                          () async {
                            _model.searchQuery = _model.textController.text;
                            safeSetState(() {});
                          },
                        ),
                        autofocus: widget.autofocus,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          alignLabelWithHint: false,
                          hintText: 'Search',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Mona Sans',
                                color: FlutterFlowTheme.of(context).foreground3,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
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
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          prefixIcon: Icon(
                            FFIcons.kproperty1Search,
                            color: FlutterFlowTheme.of(context).foreground3,
                            size: 18.0,
                          ),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    _model.searchQuery =
                                        _model.textController.text;
                                    safeSetState(() {});
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    size: 18.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Mona Sans',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
                if (widget.closeVisible)
                  Container(
                    width: 64.0,
                    height: 48.0,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.closeAction?.call();
                      },
                      child: Icon(
                        Icons.close_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
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
          Flexible(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  if (widget.searchType == SearchType.users) {
                    return Builder(
                      builder: (context) {
                        if (_model.searchQuery != null &&
                            _model.searchQuery != '') {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<UsersRow>>(
                              future: UsersTable().queryRows(
                                queryFn: (q) => q.ilike(
                                  'first_last_username',
                                  (String var1) {
                                    return '%' + var1 + '%';
                                  }(_model.searchQuery!),
                                ),
                                limit: 50,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: SpinKitSquareCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRow> usersFitleredUsersRowList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    8.0,
                                    0,
                                    120.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: usersFitleredUsersRowList.length,
                                  itemBuilder: (context, usersFitleredIndex) {
                                    final usersFitleredUsersRow =
                                        usersFitleredUsersRowList[
                                            usersFitleredIndex];
                                    return UserListItemWidget(
                                      key: Key(
                                          'Keyif3_${usersFitleredIndex}_of_${usersFitleredUsersRowList.length}'),
                                      userRow: usersFitleredUsersRow,
                                      checkBox: false,
                                      selected: false,
                                      type: UserListItemType.user,
                                      tapActionUser: (userRow) async {
                                        await widget.searchCallbackActionUser
                                            ?.call(
                                          userRow,
                                        );
                                      },
                                      tapActionConnection:
                                          (connection) async {},
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<UsersRow>>(
                              future: UsersTable().queryRows(
                                queryFn: (q) => q.not(
                                  'profile_image_url',
                                  'is',
                                  null,
                                ),
                                limit: 50,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: SpinKitSquareCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRow> usersNoFilterUsersRowList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    8.0,
                                    0,
                                    120.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: usersNoFilterUsersRowList.length,
                                  itemBuilder: (context, usersNoFilterIndex) {
                                    final usersNoFilterUsersRow =
                                        usersNoFilterUsersRowList[
                                            usersNoFilterIndex];
                                    return UserListItemWidget(
                                      key: Key(
                                          'Keyw5b_${usersNoFilterIndex}_of_${usersNoFilterUsersRowList.length}'),
                                      userRow: usersNoFilterUsersRow,
                                      checkBox: false,
                                      selected: false,
                                      type: UserListItemType.user,
                                      tapActionUser: (userRow) async {
                                        await widget.searchCallbackActionUser
                                            ?.call(
                                          userRow,
                                        );
                                      },
                                      tapActionConnection:
                                          (connection) async {},
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    );
                  } else if (widget.searchType == SearchType.connections) {
                    return Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          8.0,
                          0,
                          120.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [],
                      ),
                    );
                  } else {
                    return Text(
                      'no valid searchType',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mona Sans',
                            letterSpacing: 0.0,
                          ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
