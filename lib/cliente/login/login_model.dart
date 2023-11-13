import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CodigoLogin widget.
  FocusNode? codigoLoginFocusNode;
  TextEditingController? codigoLoginController;
  String? Function(BuildContext, String?)? codigoLoginControllerValidator;
  // State field(s) for ContraLogin widget.
  FocusNode? contraLoginFocusNode;
  TextEditingController? contraLoginController;
  late bool contraLoginVisibility;
  String? Function(BuildContext, String?)? contraLoginControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contraLoginVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    codigoLoginFocusNode?.dispose();
    codigoLoginController?.dispose();

    contraLoginFocusNode?.dispose();
    contraLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
