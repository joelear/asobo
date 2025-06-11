import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/round_player_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'round_card_model.dart';
export 'round_card_model.dart';

class RoundCardWidget extends StatefulWidget {
  const RoundCardWidget({
    super.key,
    required this.round,
  });

  final RoundStruct? round;

  @override
  State<RoundCardWidget> createState() => _RoundCardWidgetState();
}

class _RoundCardWidgetState extends State<RoundCardWidget> {
  late RoundCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoundCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dateTimeFormat(
                        "MMMEd",
                        dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                          widget.round?.dateUnixSeconds,
                          0,
                        ))),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Mona Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: 4.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.round?.teeTime,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Mona Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.round?.clubName,
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Mona Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${widget.round?.holes.toString()}H',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mona Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Container(
                      width: 4.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        functions.convertCamelCaseToTitle(
                            widget.round?.format?.name),
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mona Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.roundPlayerModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: RoundPlayerWidget(
                        roundParticipant: widget.round!.participants
                            .where(
                                (e) => e.role == RoundParticipantRole.creator)
                            .toList()
                            .firstOrNull!,
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).line1,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final invitees = widget.round?.participants
                                .where((e) =>
                                    e.role != RoundParticipantRole.creator)
                                .toList()
                                .toList() ??
                            [];

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              List.generate(invitees.length, (inviteesIndex) {
                            final inviteesItem = invitees[inviteesIndex];
                            return RoundPlayerWidget(
                              key: Key(
                                  'Keydxu_${inviteesIndex}_of_${invitees.length}'),
                              roundParticipant: inviteesItem,
                            );
                          }).divide(SizedBox(width: 12.0)),
                        );
                      },
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
