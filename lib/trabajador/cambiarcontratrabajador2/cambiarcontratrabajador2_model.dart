import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cambiarcontratrabajador2_widget.dart'
    show Cambiarcontratrabajador2Widget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cambiarcontratrabajador2Model
    extends FlutterFlowModel<Cambiarcontratrabajador2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CodigoCamContraTrabajador widget.
  TextEditingController? codigoCamContraTrabajador;
  String? Function(BuildContext, String?)? codigoCamContraTrabajadorValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    codigoCamContraTrabajador = TextEditingController();
  }

  void dispose() {
    codigoCamContraTrabajador?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
