import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontratrabajador3_widget.dart'
    show Cambiarcontratrabajador3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cambiarcontratrabajador3Model
    extends FlutterFlowModel<Cambiarcontratrabajador3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordCamContraTrabajador widget.
  FocusNode? passwordCamContraTrabajadorFocusNode;
  TextEditingController? passwordCamContraTrabajadorController;
  late bool passwordCamContraTrabajadorVisibility;
  String? Function(BuildContext, String?)?
      passwordCamContraTrabajadorControllerValidator;
  // State field(s) for passwordCamContraTrabajadorRepe widget.
  FocusNode? passwordCamContraTrabajadorRepeFocusNode;
  TextEditingController? passwordCamContraTrabajadorRepeController;
  late bool passwordCamContraTrabajadorRepeVisibility;
  String? Function(BuildContext, String?)?
      passwordCamContraTrabajadorRepeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordCamContraTrabajadorVisibility = false;
    passwordCamContraTrabajadorRepeVisibility = false;
  }

  void dispose() {
    passwordCamContraTrabajadorFocusNode?.dispose();
    passwordCamContraTrabajadorController?.dispose();

    passwordCamContraTrabajadorRepeFocusNode?.dispose();
    passwordCamContraTrabajadorRepeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
