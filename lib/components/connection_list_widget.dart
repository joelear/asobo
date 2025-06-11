import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/user_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'connection_list_model.dart';
export 'connection_list_model.dart';

class ConnectionListWidget extends StatefulWidget {
  const ConnectionListWidget({
    super.key,
    required this.tapAction,
  });

  final Future Function(UserConnectionStruct connection)? tapAction;

  @override
  State<ConnectionListWidget> createState() => _ConnectionListWidgetState();
}

class _ConnectionListWidgetState extends State<ConnectionListWidget> {
  late ConnectionListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: FutureBuilder<ApiCallResponse>(
        future: SupabaseProdGroup.getUserConnectionsCall.call(
          targetUserId: currentUserUid,
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
          final columnGetUserConnectionsResponse = snapshot.data!;

          return Builder(
            builder: (context) {
              final connection = (columnGetUserConnectionsResponse.jsonBody
                          .toList()
                          .map<UserConnectionStruct?>(
                              UserConnectionStruct.maybeFromMap)
                          .toList() as Iterable<UserConnectionStruct?>)
                      .withoutNulls
                      .toList() ??
                  [];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(connection.length, (connectionIndex) {
                  final connectionItem = connection[connectionIndex];
                  return UserListItemWidget(
                    key: Key(
                        'Keyrxa_${connectionIndex}_of_${connection.length}'),
                    checkBox: false,
                    selected: false,
                    userConnectionRow: connectionItem,
                    type: UserListItemType.connection,
                    tapActionUser: (userRow) async {
                      await widget.tapAction?.call(
                        connectionItem,
                      );
                    },
                    tapActionConnection: (connection) async {
                      await widget.tapAction?.call(
                        connection,
                      );
                    },
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}
