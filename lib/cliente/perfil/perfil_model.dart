import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for NombrePerfil widget.
  FocusNode? nombrePerfilFocusNode;
  TextEditingController? nombrePerfilController;
  String? Function(BuildContext, String?)? nombrePerfilControllerValidator;
  // State field(s) for ApellidoPPerfil widget.
  FocusNode? apellidoPPerfilFocusNode;
  TextEditingController? apellidoPPerfilController;
  String? Function(BuildContext, String?)? apellidoPPerfilControllerValidator;
  // State field(s) for ApellidoMPerfil widget.
  FocusNode? apellidoMPerfilFocusNode;
  TextEditingController? apellidoMPerfilController;
  String? Function(BuildContext, String?)? apellidoMPerfilControllerValidator;
  // State field(s) for EmailPerfil widget.
  FocusNode? emailPerfilFocusNode;
  TextEditingController? emailPerfilController;
  String? Function(BuildContext, String?)? emailPerfilControllerValidator;
  // State field(s) for TelefonoPerfil widget.
  FocusNode? telefonoPerfilFocusNode;
  TextEditingController? telefonoPerfilController;
  String? Function(BuildContext, String?)? telefonoPerfilControllerValidator;
  // State field(s) for SexoPerfil widget.
  FocusNode? sexoPerfilFocusNode;
  TextEditingController? sexoPerfilController;
  String? Function(BuildContext, String?)? sexoPerfilControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nombrePerfilFocusNode?.dispose();
    nombrePerfilController?.dispose();

    apellidoPPerfilFocusNode?.dispose();
    apellidoPPerfilController?.dispose();

    apellidoMPerfilFocusNode?.dispose();
    apellidoMPerfilController?.dispose();

    emailPerfilFocusNode?.dispose();
    emailPerfilController?.dispose();

    telefonoPerfilFocusNode?.dispose();
    telefonoPerfilController?.dispose();

    sexoPerfilFocusNode?.dispose();
    sexoPerfilController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
