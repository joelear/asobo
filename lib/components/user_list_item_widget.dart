import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_list_item_model.dart';
export 'user_list_item_model.dart';

class UserListItemWidget extends StatefulWidget {
  const UserListItemWidget({
    super.key,
    this.userRow,
    bool? checkBox,
    this.tapActionUser,
    bool? selected,
    this.userConnectionRow,
    required this.type,
    this.tapActionConnection,
  })  : this.checkBox = checkBox ?? false,
        this.selected = selected ?? false;

  final UsersRow? userRow;
  final bool checkBox;
  final Future Function(UsersRow? userRow)? tapActionUser;
  final bool selected;
  final UserConnectionStruct? userConnectionRow;
  final UserListItemType? type;
  final Future Function(UserConnectionStruct connection)? tapActionConnection;

  @override
  State<UserListItemWidget> createState() => _UserListItemWidgetState();
}

class _UserListItemWidgetState extends State<UserListItemWidget> {
  late UserListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListItemModel());
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
        if (widget.type == UserListItemType.user) {
          await widget.tapActionUser?.call(
            widget.userRow,
          );
        }
        if (widget.type == UserListItemType.connection) {
          await widget.tapActionConnection?.call(
            widget.userConnectionRow!,
          );
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: _model.selected
              ? FlutterFlowTheme.of(context).tertiary
              : FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.profileImageModel,
                updateCallback: () => safeSetState(() {}),
                child: ProfileImageWidget(
                  imageUrl: valueOrDefault<String>(
                    widget.type == UserListItemType.user
                        ? widget.userRow?.profileImageUrl
                        : widget.userConnectionRow?.profileImageUrl,
                    'https://fnadwhzjturpkenvxsat.supabase.co/storage/v1/object/public/profile_images//Blank%20Prof%20Image.png',
                  ),
                  imageBlurHash: widget.type == UserListItemType.user
                      ? widget.userRow?.profileImageBlurHash
                      : widget.userConnectionRow?.profileImageBlurHash,
                  size: CircleImageSize.medium48,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.type == UserListItemType.user
                                ? widget.userRow?.fullName
                                : '${widget.userConnectionRow?.firstName} ${widget.userConnectionRow?.lastName}',
                            'Unknow name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Mona Sans',
                                    letterSpacing: 0.0,
                                    lineHeight: 1.1,
                                  ),
                        ),
                        if (widget.userRow?.handicap != null)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'HCP: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.type == UserListItemType.user
                                      ? valueOrDefault<String>(
                                          widget.userRow?.handicap?.toString(),
                                          '0.0',
                                        )
                                      : widget.userConnectionRow?.handicap
                                          .toString(),
                                  '0.0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kproperty1Verifed2,
                              color: FlutterFlowTheme.of(context).foreground3,
                              size: 14.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.userRow?.endorsersCount?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
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
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FFIcons.kproperty1Location,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 14.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'London, UK',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mona Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    if ((widget.type == UserListItemType.connection) &&
                        (widget.userConnectionRow!.mutualConnectionCount >= 1))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FFIcons.kproperty1Profile,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 14.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget.userConnectionRow
                                          ?.mutualConnectionCount ==
                                      1
                                  ? '${widget.userConnectionRow?.firstName} ${widget.userConnectionRow?.lastName} is a mutual contact'
                                  : '${widget.userConnectionRow?.firstName} ${widget.userConnectionRow?.lastName} + ${(widget.userConnectionRow!.mutualConnectionCount - 1).toString()}  mutual${widget.userConnectionRow!.mutualConnectionCount >= 3 ? 's' : ''}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mona Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FFIcons.kproperty1Home2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 14.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Foxhill Golf Club + 1 more',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mona Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              if (widget.checkBox)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!widget.selected)
                      Icon(
                        FFIcons.kproperty1CheckCircleUnchecked,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    if (widget.selected)
                      Container(
                        width: 22.0,
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kproperty1Check,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
