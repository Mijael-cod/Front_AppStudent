import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'hometrabajador_widget.dart' show HometrabajadorWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HometrabajadorModel extends FlutterFlowModel<HometrabajadorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for ComentarioTrabajador widget.
  FocusNode? comentarioTrabajadorFocusNode1;
  TextEditingController? comentarioTrabajadorController1;
  String? Function(BuildContext, String?)?
      comentarioTrabajadorController1Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for ComentarioTrabajador widget.
  FocusNode? comentarioTrabajadorFocusNode2;
  TextEditingController? comentarioTrabajadorController2;
  String? Function(BuildContext, String?)?
      comentarioTrabajadorController2Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for ComentarioTrabajador widget.
  FocusNode? comentarioTrabajadorFocusNode3;
  TextEditingController? comentarioTrabajadorController3;
  String? Function(BuildContext, String?)?
      comentarioTrabajadorController3Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for ComentarioTrabajador widget.
  FocusNode? comentarioTrabajadorFocusNode4;
  TextEditingController? comentarioTrabajadorController4;
  String? Function(BuildContext, String?)?
      comentarioTrabajadorController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    comentarioTrabajadorFocusNode1?.dispose();
    comentarioTrabajadorController1?.dispose();

    comentarioTrabajadorFocusNode2?.dispose();
    comentarioTrabajadorController2?.dispose();

    comentarioTrabajadorFocusNode3?.dispose();
    comentarioTrabajadorController3?.dispose();

    comentarioTrabajadorFocusNode4?.dispose();
    comentarioTrabajadorController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
