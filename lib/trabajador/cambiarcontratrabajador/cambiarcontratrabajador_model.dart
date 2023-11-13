import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontratrabajador_widget.dart' show CambiarcontratrabajadorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CambiarcontratrabajadorModel
    extends FlutterFlowModel<CambiarcontratrabajadorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailCamContraTrabajador widget.
  FocusNode? emailCamContraTrabajadorFocusNode;
  TextEditingController? emailCamContraTrabajadorController;
  String? Function(BuildContext, String?)?
      emailCamContraTrabajadorControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailCamContraTrabajadorFocusNode?.dispose();
    emailCamContraTrabajadorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
