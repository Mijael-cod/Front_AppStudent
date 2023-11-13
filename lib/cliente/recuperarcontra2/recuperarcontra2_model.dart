import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'recuperarcontra2_widget.dart' show Recuperarcontra2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Recuperarcontra2Model extends FlutterFlowModel<Recuperarcontra2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CodigoRecuperar widget.
  TextEditingController? codigoRecuperar;
  String? Function(BuildContext, String?)? codigoRecuperarValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    codigoRecuperar = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    codigoRecuperar?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
