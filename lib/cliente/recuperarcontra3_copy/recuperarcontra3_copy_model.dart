import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'recuperarcontra3_copy_widget.dart' show Recuperarcontra3CopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Recuperarcontra3CopyModel
    extends FlutterFlowModel<Recuperarcontra3CopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for passwordRecupe widget.
  FocusNode? passwordRecupeFocusNode;
  TextEditingController? passwordRecupeController;
  late bool passwordRecupeVisibility;
  String? Function(BuildContext, String?)? passwordRecupeControllerValidator;
  // State field(s) for passwordRecupeRepeti widget.
  FocusNode? passwordRecupeRepetiFocusNode;
  TextEditingController? passwordRecupeRepetiController;
  late bool passwordRecupeRepetiVisibility;
  String? Function(BuildContext, String?)?
      passwordRecupeRepetiControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordRecupeVisibility = false;
    passwordRecupeRepetiVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    passwordRecupeFocusNode?.dispose();
    passwordRecupeController?.dispose();

    passwordRecupeRepetiFocusNode?.dispose();
    passwordRecupeRepetiController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
