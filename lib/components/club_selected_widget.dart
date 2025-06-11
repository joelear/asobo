import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'club_selected_model.dart';
export 'club_selected_model.dart';

class ClubSelectedWidget extends StatefulWidget {
  const ClubSelectedWidget({
    super.key,
    this.clubRow,
    this.closeAction,
    bool? hideDelete,
  }) : this.hideDelete = hideDelete ?? false;

  final ClubsRow? clubRow;
  final Future Function(String? clubId, ClubsRow? clubRow)? closeAction;
  final bool hideDelete;

  @override
  State<ClubSelectedWidget> createState() => _ClubSelectedWidgetState();
}

class _ClubSelectedWidgetState extends State<ClubSelectedWidget> {
  late ClubSelectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubSelectedModel());
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
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget.clubRow?.clubName,
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
                    widget.clubRow?.id,
                    widget.clubRow,
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
        ].addToStart(SizedBox(width: 16.0)),
      ),
    );
  }
}
