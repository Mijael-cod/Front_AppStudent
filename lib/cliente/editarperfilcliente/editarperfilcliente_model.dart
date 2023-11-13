import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'editarperfilcliente_widget.dart' show EditarperfilclienteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarperfilclienteModel
    extends FlutterFlowModel<EditarperfilclienteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for NombreEditarPerfil widget.
  FocusNode? nombreEditarPerfilFocusNode;
  TextEditingController? nombreEditarPerfilController;
  String? Function(BuildContext, String?)?
      nombreEditarPerfilControllerValidator;
  // State field(s) for ApellidoPEditarPerfil widget.
  FocusNode? apellidoPEditarPerfilFocusNode;
  TextEditingController? apellidoPEditarPerfilController;
  String? Function(BuildContext, String?)?
      apellidoPEditarPerfilControllerValidator;
  // State field(s) for ApellidoMEditarPerfil widget.
  FocusNode? apellidoMEditarPerfilFocusNode;
  TextEditingController? apellidoMEditarPerfilController;
  String? Function(BuildContext, String?)?
      apellidoMEditarPerfilControllerValidator;
  // State field(s) for EmailEditarPerfil widget.
  FocusNode? emailEditarPerfilFocusNode;
  TextEditingController? emailEditarPerfilController;
  String? Function(BuildContext, String?)? emailEditarPerfilControllerValidator;
  // State field(s) for TelefonoEditarPerfil widget.
  FocusNode? telefonoEditarPerfilFocusNode;
  TextEditingController? telefonoEditarPerfilController;
  String? Function(BuildContext, String?)?
      telefonoEditarPerfilControllerValidator;
  // State field(s) for SexoEditarPerfil widget.
  FocusNode? sexoEditarPerfilFocusNode;
  TextEditingController? sexoEditarPerfilController;
  String? Function(BuildContext, String?)? sexoEditarPerfilControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nombreEditarPerfilFocusNode?.dispose();
    nombreEditarPerfilController?.dispose();

    apellidoPEditarPerfilFocusNode?.dispose();
    apellidoPEditarPerfilController?.dispose();

    apellidoMEditarPerfilFocusNode?.dispose();
    apellidoMEditarPerfilController?.dispose();

    emailEditarPerfilFocusNode?.dispose();
    emailEditarPerfilController?.dispose();

    telefonoEditarPerfilFocusNode?.dispose();
    telefonoEditarPerfilController?.dispose();

    sexoEditarPerfilFocusNode?.dispose();
    sexoEditarPerfilController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
