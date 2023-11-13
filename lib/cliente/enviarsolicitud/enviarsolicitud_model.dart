import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'enviarsolicitud_widget.dart' show EnviarsolicitudWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnviarsolicitudModel extends FlutterFlowModel<EnviarsolicitudWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for ComentarSolicitud widget.
  FocusNode? comentarSolicitudFocusNode;
  TextEditingController? comentarSolicitudController;
  String? Function(BuildContext, String?)? comentarSolicitudControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    comentarSolicitudFocusNode?.dispose();
    comentarSolicitudController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
