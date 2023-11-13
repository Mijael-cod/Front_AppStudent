import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontra1_widget.dart' show Cambiarcontra1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cambiarcontra1Model extends FlutterFlowModel<Cambiarcontra1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailCamContra widget.
  FocusNode? emailCamContraFocusNode;
  TextEditingController? emailCamContraController;
  String? Function(BuildContext, String?)? emailCamContraControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailCamContraFocusNode?.dispose();
    emailCamContraController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
