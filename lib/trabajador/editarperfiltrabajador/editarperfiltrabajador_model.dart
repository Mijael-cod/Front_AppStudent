import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'editarperfiltrabajador_widget.dart' show EditarperfiltrabajadorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarperfiltrabajadorModel
    extends FlutterFlowModel<EditarperfiltrabajadorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for NombreEditarPerfilTrabajador widget.
  FocusNode? nombreEditarPerfilTrabajadorFocusNode;
  TextEditingController? nombreEditarPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      nombreEditarPerfilTrabajadorControllerValidator;
  // State field(s) for ApellidoPEditarPerilTrabajador widget.
  FocusNode? apellidoPEditarPerilTrabajadorFocusNode;
  TextEditingController? apellidoPEditarPerilTrabajadorController;
  String? Function(BuildContext, String?)?
      apellidoPEditarPerilTrabajadorControllerValidator;
  // State field(s) for ApellidoMEditarPerfilTrabajador widget.
  FocusNode? apellidoMEditarPerfilTrabajadorFocusNode;
  TextEditingController? apellidoMEditarPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      apellidoMEditarPerfilTrabajadorControllerValidator;
  // State field(s) for TelefonoEditarPerfilTrabajador widget.
  FocusNode? telefonoEditarPerfilTrabajadorFocusNode1;
  TextEditingController? telefonoEditarPerfilTrabajadorController1;
  String? Function(BuildContext, String?)?
      telefonoEditarPerfilTrabajadorController1Validator;
  // State field(s) for TelefonoEditarPerfilTrabajador widget.
  FocusNode? telefonoEditarPerfilTrabajadorFocusNode2;
  TextEditingController? telefonoEditarPerfilTrabajadorController2;
  String? Function(BuildContext, String?)?
      telefonoEditarPerfilTrabajadorController2Validator;
  // State field(s) for SexoEditarPerfilTrabajador widget.
  FocusNode? sexoEditarPerfilTrabajadorFocusNode;
  TextEditingController? sexoEditarPerfilTrabajadorController;
  String? Function(BuildContext, String?)?
      sexoEditarPerfilTrabajadorControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nombreEditarPerfilTrabajadorFocusNode?.dispose();
    nombreEditarPerfilTrabajadorController?.dispose();

    apellidoPEditarPerilTrabajadorFocusNode?.dispose();
    apellidoPEditarPerilTrabajadorController?.dispose();

    apellidoMEditarPerfilTrabajadorFocusNode?.dispose();
    apellidoMEditarPerfilTrabajadorController?.dispose();

    telefonoEditarPerfilTrabajadorFocusNode1?.dispose();
    telefonoEditarPerfilTrabajadorController1?.dispose();

    telefonoEditarPerfilTrabajadorFocusNode2?.dispose();
    telefonoEditarPerfilTrabajadorController2?.dispose();

    sexoEditarPerfilTrabajadorFocusNode?.dispose();
    sexoEditarPerfilTrabajadorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
