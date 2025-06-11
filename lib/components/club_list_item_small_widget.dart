import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'club_list_item_small_model.dart';
export 'club_list_item_small_model.dart';

class ClubListItemSmallWidget extends StatefulWidget {
  const ClubListItemSmallWidget({
    super.key,
    required this.club,
    required this.action,
  });

  final ClubsRow? club;
  final Future Function()? action;

  @override
  State<ClubListItemSmallWidget> createState() =>
      _ClubListItemSmallWidgetState();
}

class _ClubListItemSmallWidgetState extends State<ClubListItemSmallWidget> {
  late ClubListItemSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubListItemSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                child: Icon(
                  FFIcons.kproperty1FlagCircle,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 18.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.club?.clubName,
                        'Club name',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Mona Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      '${valueOrDefault<String>(
                        widget.club?.state,
                        'state',
                      )}, ${valueOrDefault<String>(
                        widget.club?.country,
                        'country',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mona Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
