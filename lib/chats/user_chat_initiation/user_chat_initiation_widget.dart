import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_chat_initiation_model.dart';
export 'user_chat_initiation_model.dart';

class UserChatInitiationWidget extends StatefulWidget {
  const UserChatInitiationWidget({
    super.key,
    required this.userId,
    this.action,
  });

  final String? userId;
  final Future Function(UsersRow userRow, String userId)? action;

  @override
  State<UserChatInitiationWidget> createState() =>
      _UserChatInitiationWidgetState();
}

class _UserChatInitiationWidgetState extends State<UserChatInitiationWidget> {
  late UserChatInitiationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserChatInitiationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userRowOutput = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.userId,
        ),
      );
      _model.userRow = _model.userRowOutput?.firstOrNull;
      safeSetState(() {});
    });
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
      height: 100.0,
      decoration: BoxDecoration(),
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
                imageUrl: _model.userRow?.profileImageUrl,
                imageBlurHash: _model.userRow?.profileImageBlurHash,
                size: CircleImageSize.medium48,
              ),
            ),
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  _model.userRow?.fullName,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Mona Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                await widget.action?.call(
                  _model.userRow!,
                  _model.userRow!.id,
                );
              },
              text: 'Start chat',
              icon: Icon(
                FFIcons.kproperty1Add,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 44.0,
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Mona Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
