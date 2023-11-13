import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registrarse2_widget.dart' show Registrarse2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registrarse2Model extends FlutterFlowModel<Registrarse2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailRegistrarse widget.
  FocusNode? emailRegistrarseFocusNode;
  TextEditingController? emailRegistrarseController;
  String? Function(BuildContext, String?)? emailRegistrarseControllerValidator;
  // State field(s) for TelefonoRegistrarse widget.
  FocusNode? telefonoRegistrarseFocusNode;
  TextEditingController? telefonoRegistrarseController;
  String? Function(BuildContext, String?)?
      telefonoRegistrarseControllerValidator;
  // State field(s) for passwordRegistrarse widget.
  FocusNode? passwordRegistrarseFocusNode;
  TextEditingController? passwordRegistrarseController;
  late bool passwordRegistrarseVisibility;
  String? Function(BuildContext, String?)?
      passwordRegistrarseControllerValidator;
  // State field(s) for passwordRegistrarseRepi widget.
  FocusNode? passwordRegistrarseRepiFocusNode;
  TextEditingController? passwordRegistrarseRepiController;
  late bool passwordRegistrarseRepiVisibility;
  String? Function(BuildContext, String?)?
      passwordRegistrarseRepiControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordRegistrarseVisibility = false;
    passwordRegistrarseRepiVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailRegistrarseFocusNode?.dispose();
    emailRegistrarseController?.dispose();

    telefonoRegistrarseFocusNode?.dispose();
    telefonoRegistrarseController?.dispose();

    passwordRegistrarseFocusNode?.dispose();
    passwordRegistrarseController?.dispose();

    passwordRegistrarseRepiFocusNode?.dispose();
    passwordRegistrarseRepiController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
