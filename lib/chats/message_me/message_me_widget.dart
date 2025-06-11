import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'message_me_model.dart';
export 'message_me_model.dart';

class MessageMeWidget extends StatefulWidget {
  const MessageMeWidget({
    super.key,
    String? text,
    this.time,
    bool? singleMessage,
  })  : this.text = text ?? '',
        this.singleMessage = singleMessage ?? true;

  final String text;
  final DateTime? time;
  final bool singleMessage;

  @override
  State<MessageMeWidget> createState() => _MessageMeWidgetState();
}

class _MessageMeWidgetState extends State<MessageMeWidget> {
  late MessageMeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageMeModel());
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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.singleMessage)
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 6.0,
              decoration: BoxDecoration(),
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).background3,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 8.0),
                          child: Wrap(
                            spacing: 6.0,
                            runSpacing: 2.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.text,
                                  'message_text',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.5),
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat("Hm", widget.time),
                                    '00:00',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .foreground3,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
