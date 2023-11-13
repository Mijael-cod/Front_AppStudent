import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registrarse1_widget.dart' show Registrarse1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registrarse1Model extends FlutterFlowModel<Registrarse1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for codigoRegistrarse widget.
  FocusNode? codigoRegistrarseFocusNode;
  TextEditingController? codigoRegistrarseController;
  String? Function(BuildContext, String?)? codigoRegistrarseControllerValidator;
  // State field(s) for nombreRegistrarse widget.
  FocusNode? nombreRegistrarseFocusNode;
  TextEditingController? nombreRegistrarseController;
  String? Function(BuildContext, String?)? nombreRegistrarseControllerValidator;
  // State field(s) for apellidopRegistrarse widget.
  FocusNode? apellidopRegistrarseFocusNode;
  TextEditingController? apellidopRegistrarseController;
  String? Function(BuildContext, String?)?
      apellidopRegistrarseControllerValidator;
  // State field(s) for apellidomRegistrarse widget.
  FocusNode? apellidomRegistrarseFocusNode;
  TextEditingController? apellidomRegistrarseController;
  String? Function(BuildContext, String?)?
      apellidomRegistrarseControllerValidator;
  // State field(s) for SexoRegistrarse widget.
  FocusNode? sexoRegistrarseFocusNode;
  TextEditingController? sexoRegistrarseController;
  String? Function(BuildContext, String?)? sexoRegistrarseControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    codigoRegistrarseFocusNode?.dispose();
    codigoRegistrarseController?.dispose();

    nombreRegistrarseFocusNode?.dispose();
    nombreRegistrarseController?.dispose();

    apellidopRegistrarseFocusNode?.dispose();
    apellidopRegistrarseController?.dispose();

    apellidomRegistrarseFocusNode?.dispose();
    apellidomRegistrarseController?.dispose();

    sexoRegistrarseFocusNode?.dispose();
    sexoRegistrarseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
