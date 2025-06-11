import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'round_player_widget.dart' show RoundPlayerWidget;
import 'package:flutter/material.dart';

class RoundPlayerModel extends FlutterFlowModel<RoundPlayerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileImage component.
  late ProfileImageModel profileImageModel;

  @override
  void initState(BuildContext context) {
    profileImageModel = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    profileImageModel.dispose();
  }
}
