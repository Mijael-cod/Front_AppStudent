import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'perfiltrabajador_widget.dart' show PerfiltrabajadorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfiltrabajadorModel extends FlutterFlowModel<PerfiltrabajadorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for NombrePerfilTrabajador widget.
  FocusNode? nombrePerfilTrabajadorFocusNode;
  TextEditingController? nombrePerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      nombrePerfilTrabajadorControllerValidator;
  // State field(s) for ApellidoPPerfilTrabajador widget.
  FocusNode? apellidoPPerfilTrabajadorFocusNode;
  TextEditingController? apellidoPPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      apellidoPPerfilTrabajadorControllerValidator;
  // State field(s) for ApellidoMPerfilTrabajador widget.
  FocusNode? apellidoMPerfilTrabajadorFocusNode;
  TextEditingController? apellidoMPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      apellidoMPerfilTrabajadorControllerValidator;
  // State field(s) for EmailPerfilTrabajador widget.
  FocusNode? emailPerfilTrabajadorFocusNode;
  TextEditingController? emailPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      emailPerfilTrabajadorControllerValidator;
  // State field(s) for TelefonoPerfilTrabajador widget.
  FocusNode? telefonoPerfilTrabajadorFocusNode;
  TextEditingController? telefonoPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      telefonoPerfilTrabajadorControllerValidator;
  // State field(s) for SexoPerfilTrabajador widget.
  FocusNode? sexoPerfilTrabajadorFocusNode;
  TextEditingController? sexoPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      sexoPerfilTrabajadorControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nombrePerfilTrabajadorFocusNode?.dispose();
    nombrePerfilTrabajadorController?.dispose();

    apellidoPPerfilTrabajadorFocusNode?.dispose();
    apellidoPPerfilTrabajadorController?.dispose();

    apellidoMPerfilTrabajadorFocusNode?.dispose();
    apellidoMPerfilTrabajadorController?.dispose();

    emailPerfilTrabajadorFocusNode?.dispose();
    emailPerfilTrabajadorController?.dispose();

    telefonoPerfilTrabajadorFocusNode?.dispose();
    telefonoPerfilTrabajadorController?.dispose();

    sexoPerfilTrabajadorFocusNode?.dispose();
    sexoPerfilTrabajadorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
