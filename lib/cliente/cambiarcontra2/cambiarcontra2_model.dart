import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontra2_widget.dart' show Cambiarcontra2Widget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cambiarcontra2Model extends FlutterFlowModel<Cambiarcontra2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CodCamContra widget.
  TextEditingController? codCamContra;
  String? Function(BuildContext, String?)? codCamContraValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    codCamContra = TextEditingController();
  }

  void dispose() {
    codCamContra?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
