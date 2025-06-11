import '/backend/schema/enums/enums.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'message_other_model.dart';
export 'message_other_model.dart';

class MessageOtherWidget extends StatefulWidget {
  const MessageOtherWidget({
    super.key,
    String? text,
    required this.time,
    required this.senderFullName,
    required this.imageUrl,
    required this.imageBlurHash,
    required this.isGroup,
    bool? showNameAndPic,
  })  : this.text = text ?? '',
        this.showNameAndPic = showNameAndPic ?? false;

  final String text;
  final DateTime? time;
  final String? senderFullName;
  final String? imageUrl;
  final String? imageBlurHash;
  final bool? isGroup;
  final bool showNameAndPic;

  @override
  State<MessageOtherWidget> createState() => _MessageOtherWidgetState();
}

class _MessageOtherWidgetState extends State<MessageOtherWidget> {
  late MessageOtherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageOtherModel());
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.isGroup ?? true)
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(),
              child: Visibility(
                visible: valueOrDefault<bool>(
                  widget.showNameAndPic,
                  true,
                ),
                child: wrapWithModel(
                  model: _model.profileImageModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ProfileImageWidget(
                    imageUrl: valueOrDefault<String>(
                      widget.imageUrl,
                      'https://fnadwhzjturpkenvxsat.supabase.co/storage/v1/object/public/profile_images//Blank%20Prof%20Image.png',
                    ),
                    imageBlurHash: widget.imageBlurHash,
                    size: CircleImageSize.small32,
                  ),
                ),
              ),
            ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isGroup! && widget.showNameAndPic)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.senderFullName,
                          'sender_name',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Mona Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Mona Sans',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
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
    );
  }
}
