import '/components/round_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'round_card_widget.dart' show RoundCardWidget;
import 'package:flutter/material.dart';

class RoundCardModel extends FlutterFlowModel<RoundCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for roundPlayer component.
  late RoundPlayerModel roundPlayerModel1;

  @override
  void initState(BuildContext context) {
    roundPlayerModel1 = createModel(context, () => RoundPlayerModel());
  }

  @override
  void dispose() {
    roundPlayerModel1.dispose();
  }
}
