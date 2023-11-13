import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'calificar_widget.dart' show CalificarWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalificarModel extends FlutterFlowModel<CalificarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for ComentarCalifica widget.
  FocusNode? comentarCalificaFocusNode1;
  TextEditingController? comentarCalificaController1;
  String? Function(BuildContext, String?)? comentarCalificaController1Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for ComentarCalifica widget.
  FocusNode? comentarCalificaFocusNode2;
  TextEditingController? comentarCalificaController2;
  String? Function(BuildContext, String?)? comentarCalificaController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    comentarCalificaFocusNode1?.dispose();
    comentarCalificaController1?.dispose();

    comentarCalificaFocusNode2?.dispose();
    comentarCalificaController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
