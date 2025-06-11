import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/search_users_widget.dart';
import '/components/user_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_contacts_setup_model.dart';
export 'add_contacts_setup_model.dart';

class AddContactsSetupWidget extends StatefulWidget {
  const AddContactsSetupWidget({super.key});

  static String routeName = 'addContactsSetup';
  static String routePath = '/addContactsSetup';

  @override
  State<AddContactsSetupWidget> createState() => _AddContactsSetupWidgetState();
}

class _AddContactsSetupWidgetState extends State<AddContactsSetupWidget> {
  late AddContactsSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddContactsSetupModel());
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
                  titleVisible: false,
                  actionVisible: true,
                  actionText: 'Sign out',
                  backAction: () async {},
                  action: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth(
                        PreAuthWidget.routeName, context.mounted);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'Add contacts',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily: 'Mona Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      barrierColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: SearchUsersWidget(
                                                searchType: SearchType.users,
                                                closeVisible: true,
                                                autofocus: true,
                                                searchCallbackActionUser:
                                                    (userRow) async {
                                                  _model
                                                      .addToSelectedContactRows(
                                                          userRow!);
                                                  _model
                                                      .addToSelectedContactIds(
                                                          userRow.id);
                                                  _model
                                                      .removeFromSelectedSuggestedContactRows(
                                                          userRow);
                                                  _model
                                                      .removeFromSelectedSuggestedContactIds(
                                                          userRow.id);
                                                  safeSetState(() {});
                                                  Navigator.pop(context);
                                                },
                                                searchCallbackActionConnection:
                                                    (connection) async {},
                                                closeAction: () async {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 8.0, 0.0),
                                          child: Icon(
                                            FFIcons.kproperty1Search,
                                            color: FlutterFlowTheme.of(context)
                                                .foreground3,
                                            size: 18.0,
                                          ),
                                        ),
                                        Text(
                                          'Search for ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .foreground3,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          'contacts',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .foreground3,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                        ),
                        if (_model.selectedContactIds.length >= 1)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final selectedContactRow =
                                        _model.selectedContactRows.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          selectedContactRow.length,
                                          (selectedContactRowIndex) {
                                        final selectedContactRowItem =
                                            selectedContactRow[
                                                selectedContactRowIndex];
                                        return UserListItemWidget(
                                          key: Key(
                                              'Keyk7p_${selectedContactRowIndex}_of_${selectedContactRow.length}'),
                                          checkBox: true,
                                          userRow: selectedContactRowItem,
                                          selected: true,
                                          type: UserListItemType.user,
                                          tapActionUser: (userRow) async {
                                            if (_model.selectedContactIds
                                                    .contains(
                                                        selectedContactRowItem
                                                            .id) ==
                                                false) {
                                              _model.addToSelectedContactRows(
                                                  selectedContactRowItem);
                                              _model.addToSelectedContactIds(
                                                  selectedContactRowItem.id);
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .removeFromSelectedContactRows(
                                                      selectedContactRowItem);
                                              _model
                                                  .removeFromSelectedContactIds(
                                                      selectedContactRowItem
                                                          .id);
                                              safeSetState(() {});
                                            }

                                            _model
                                                .removeFromSelectedSuggestedContactRows(
                                                    selectedContactRowItem);
                                            _model
                                                .removeFromSelectedSuggestedContactIds(
                                                    selectedContactRowItem.id);
                                            safeSetState(() {});
                                          },
                                          tapActionConnection:
                                              (connection) async {},
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Suggested contacts',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Mona Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  FutureBuilder<List<UsersRow>>(
                                    future: UsersTable().queryRows(
                                      queryFn: (q) => q,
                                      limit: 5,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 24.0,
                                            height: 24.0,
                                            child: SpinKitSquareCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRow> columnUsersRowList =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnUsersRowList.length,
                                            (columnIndex) {
                                          final columnUsersRow =
                                              columnUsersRowList[columnIndex];
                                          return Visibility(
                                            visible: _model.selectedContactIds
                                                    .contains(
                                                        columnUsersRow.id) ==
                                                false,
                                            child: UserListItemWidget(
                                              key: Key(
                                                  'Key8zq_${columnIndex}_of_${columnUsersRowList.length}'),
                                              checkBox: true,
                                              userRow: columnUsersRow,
                                              selected: _model
                                                  .selectedSuggestedContactIds
                                                  .contains(columnUsersRow.id),
                                              type: UserListItemType.user,
                                              tapActionUser: (userRow) async {
                                                if (_model
                                                        .selectedSuggestedContactIds
                                                        .contains(columnUsersRow
                                                            .id) ==
                                                    false) {
                                                  _model
                                                      .addToSelectedSuggestedContactRows(
                                                          columnUsersRow);
                                                  _model
                                                      .addToSelectedSuggestedContactIds(
                                                          columnUsersRow.id);
                                                  safeSetState(() {});
                                                } else {
                                                  _model
                                                      .removeFromSelectedSuggestedContactRows(
                                                          columnUsersRow);
                                                  _model
                                                      .removeFromSelectedSuggestedContactIds(
                                                          columnUsersRow.id);
                                                  safeSetState(() {});
                                                }
                                              },
                                              tapActionConnection:
                                                  (connection) async {},
                                            ),
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
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomOptionsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomOptionsWidget(
                    primaryVisible: true,
                    secondaryVisible: false,
                    tertiaryVisible: false,
                    primaryText: (_model.selectedContactIds.length >= 1) ||
                            (_model.selectedSuggestedContactIds.length >= 1)
                        ? 'Add ${(_model.selectedContactIds.length + _model.selectedSuggestedContactIds.length).toString()}${(_model.selectedContactIds.length + _model.selectedSuggestedContactIds.length).toString() == '1' ? ' contact' : ' contacts'}'
                        : 'Continue without adding contacts',
                    tertiaryText: 'Join waitlist',
                    primaryAction: () async {
                      // Set onboarding stage
                      await UsersTable().update(
                        data: {
                          'onboarding_stage': 'complete',
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          currentUserUid,
                        ),
                      );

                      context.pushNamed(HomeWidget.routeName);

                      while (_model.addedSelectedUsers! <
                          _model.selectedContactIds.length) {
                        await ConnectionsTable().insert({
                          'sender_user_id': currentUserUid,
                          'recipient_user_id': _model.selectedContactIds
                              .elementAtOrNull(_model.addedSelectedUsers!),
                          'status': ConnectionStatus.pending.name,
                          'created_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                        });
                        _model.addedSelectedUsers =
                            _model.addedSelectedUsers! + 1;
                        safeSetState(() {});
                      }
                      while (_model.addedSuggestedUsers! <
                          (_model.selectedContactIds.length +
                              _model.selectedSuggestedContactIds.length)) {
                        await ConnectionsTable().insert({
                          'sender_user_id': currentUserUid,
                          'recipient_user_id': _model
                              .selectedSuggestedContactIds
                              .elementAtOrNull(_model.addedSuggestedUsers!),
                          'status': ConnectionStatus.pending.name,
                          'created_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                        });
                        _model.addedSuggestedUsers =
                            _model.addedSuggestedUsers! + 1;
                        safeSetState(() {});
                      }
                    },
                    secondaryAction: () async {},
                    tertiaryAction: () async {},
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
