import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontra3_widget.dart' show Cambiarcontra3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cambiarcontra3Model extends FlutterFlowModel<Cambiarcontra3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordCam widget.
  FocusNode? passwordCamFocusNode;
  TextEditingController? passwordCamController;
  late bool passwordCamVisibility;
  String? Function(BuildContext, String?)? passwordCamControllerValidator;
  // State field(s) for passwordContraRepe widget.
  FocusNode? passwordContraRepeFocusNode;
  TextEditingController? passwordContraRepeController;
  late bool passwordContraRepeVisibility;
  String? Function(BuildContext, String?)?
      passwordContraRepeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordCamVisibility = false;
    passwordContraRepeVisibility = false;
  }

  void dispose() {
    passwordCamFocusNode?.dispose();
    passwordCamController?.dispose();

    passwordContraRepeFocusNode?.dispose();
    passwordContraRepeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
