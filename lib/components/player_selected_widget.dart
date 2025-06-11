import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'player_selected_model.dart';
export 'player_selected_model.dart';

class PlayerSelectedWidget extends StatefulWidget {
  const PlayerSelectedWidget({
    super.key,
    this.closeAction,
    bool? hideDelete,
    required this.userId,
    required this.fullName,
    required this.profileImageUrl,
    required this.profileImageBlurHash,
    this.connection,
  }) : this.hideDelete = hideDelete ?? false;

  final Future Function(String? userId, UserConnectionStruct connection)?
      closeAction;
  final bool hideDelete;
  final String? userId;
  final String? fullName;
  final String? profileImageUrl;
  final String? profileImageBlurHash;
  final UserConnectionStruct? connection;

  @override
  State<PlayerSelectedWidget> createState() => _PlayerSelectedWidgetState();
}

class _PlayerSelectedWidgetState extends State<PlayerSelectedWidget> {
  late PlayerSelectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerSelectedModel());
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
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            child: wrapWithModel(
              model: _model.profileImageModel,
              updateCallback: () => safeSetState(() {}),
              child: ProfileImageWidget(
                imageUrl: widget.profileImageUrl,
                imageBlurHash: widget.profileImageBlurHash,
                size: CircleImageSize.medium48,
              ),
            ),
          ),
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget.fullName,
                '-',
              ),
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Mona Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(),
            child: Visibility(
              visible: !widget.hideDelete,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.closeAction?.call(
                    widget.userId,
                    widget.connection!,
                  );
                },
                child: Icon(
                  FFIcons.kproperty1Close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ].addToStart(SizedBox(width: 8.0)),
      ),
    );
  }
}
