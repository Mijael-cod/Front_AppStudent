import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cambiarcontratrabajador3_model.dart';
export 'cambiarcontratrabajador3_model.dart';

class Cambiarcontratrabajador3Widget extends StatefulWidget {
  const Cambiarcontratrabajador3Widget({Key? key}) : super(key: key);

  @override
  _Cambiarcontratrabajador3WidgetState createState() =>
      _Cambiarcontratrabajador3WidgetState();
}

class _Cambiarcontratrabajador3WidgetState
    extends State<Cambiarcontratrabajador3Widget> {
  late Cambiarcontratrabajador3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cambiarcontratrabajador3Model());

    _model.passwordCamContraTrabajadorController ??= TextEditingController();
    _model.passwordCamContraTrabajadorFocusNode ??= FocusNode();

    _model.passwordCamContraTrabajadorRepeController ??=
        TextEditingController();
    _model.passwordCamContraTrabajadorRepeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF5998D1),
                size: 35.0,
              ),
              onPressed: () async {
                context.pushNamed('configtrabajador');
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 35.0, 0.0, 0.0),
            child: Text(
              'Cambiar contraseña',
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
      ),
      body: Align(
        alignment: AlignmentDirectional(0.00, -1.00),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 4.0, 18.0, 4.0),
                child: Text(
                  'La contraseña debe tener al menos seis caracteres e incluir una combienación de numeros, letras y caracteres\nespeciales (!\$@%)',
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
                    child: Container(
                      width: 300.0,
                      child: TextFormField(
                        controller:
                            _model.passwordCamContraTrabajadorController,
                        focusNode: _model.passwordCamContraTrabajadorFocusNode,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText:
                            !_model.passwordCamContraTrabajadorVisibility,
                        decoration: InputDecoration(
                          labelText: 'Nueva contraseña',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF5998D1),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).accent4,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model
                                      .passwordCamContraTrabajadorVisibility =
                                  !_model.passwordCamContraTrabajadorVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordCamContraTrabajadorVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                            ),
                        validator: _model
                            .passwordCamContraTrabajadorControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 16.0),
                    child: Container(
                      width: 300.0,
                      child: TextFormField(
                        controller:
                            _model.passwordCamContraTrabajadorRepeController,
                        focusNode:
                            _model.passwordCamContraTrabajadorRepeFocusNode,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText:
                            !_model.passwordCamContraTrabajadorRepeVisibility,
                        decoration: InputDecoration(
                          labelText: 'Vuelve a escribir la contraseña',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF5998D1),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).accent4,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model
                                      .passwordCamContraTrabajadorRepeVisibility =
                                  !_model
                                      .passwordCamContraTrabajadorRepeVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordCamContraTrabajadorRepeVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                            ),
                        validator: _model
                            .passwordCamContraTrabajadorRepeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('configtrabajador');
                    },
                    text: 'Guardar contraseña',
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall,
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
