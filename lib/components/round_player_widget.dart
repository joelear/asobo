import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'round_player_model.dart';
export 'round_player_model.dart';

class RoundPlayerWidget extends StatefulWidget {
  const RoundPlayerWidget({
    super.key,
    required this.roundParticipant,
  });

  final RoundParticipantStruct? roundParticipant;

  @override
  State<RoundPlayerWidget> createState() => _RoundPlayerWidgetState();
}

class _RoundPlayerWidgetState extends State<RoundPlayerWidget> {
  late RoundPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoundPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 64.0,
      ),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.profileImageModel,
            updateCallback: () => safeSetState(() {}),
            child: ProfileImageWidget(
              imageUrl: widget.roundParticipant?.profileImageUrl,
              imageBlurHash: widget.roundParticipant?.profileImageBlurHash,
              size: CircleImageSize.large64,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.roundParticipant?.firstName,
                '-',
              ),
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Mona Sans',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                () {
                  if (widget.roundParticipant?.role ==
                      RoundParticipantRole.creator) {
                    return 'Host';
                  } else if ((widget.roundParticipant?.role ==
                          RoundParticipantRole.player) &&
                      (widget.roundParticipant?.status ==
                          RoundParticipantStatus.invited)) {
                    return 'Pending';
                  } else if ((widget.roundParticipant?.role ==
                          RoundParticipantRole.player) &&
                      (widget.roundParticipant?.status ==
                          RoundParticipantStatus.accepted)) {
                    return 'Confirmed';
                  } else {
                    return widget.roundParticipant?.status?.name;
                  }
                }(),
                '-',
              ),
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Mona Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
