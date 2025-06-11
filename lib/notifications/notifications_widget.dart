import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/notification_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'Notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
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
                  actionVisible: false,
                  titleText: 'Notifications',
                  actionText: '',
                  backAction: () async {
                    context.safePop();
                  },
                  action: () async {},
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<NotificationsRow>>(
                    stream: _model.listViewSupabaseStream ??= SupaFlow.client
                        .from("notifications")
                        .stream(primaryKey: ['id'])
                        .eqOrNull(
                          'user_id',
                          currentUserUid,
                        )
                        .order('created_at')
                        .map((list) => list
                            .map((item) => NotificationsRow(item))
                            .toList()),
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
                      List<NotificationsRow> listViewNotificationsRowList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNotificationsRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewNotificationsRow =
                              listViewNotificationsRowList[listViewIndex];
                          return NotificationWidget(
                            key: Key(
                                'Keyaei_${listViewIndex}_of_${listViewNotificationsRowList.length}'),
                            notification: listViewNotificationsRow,
                          );
                        },
                      );
                    },
                  ),
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
      ),
    );
  }
}
