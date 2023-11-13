import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'recuperarcontra_widget.dart' show RecuperarcontraWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecuperarcontraModel extends FlutterFlowModel<RecuperarcontraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CodigoRecu widget.
  FocusNode? codigoRecuFocusNode;
  TextEditingController? codigoRecuController;
  String? Function(BuildContext, String?)? codigoRecuControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    codigoRecuFocusNode?.dispose();
    codigoRecuController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
