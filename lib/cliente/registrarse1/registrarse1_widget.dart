import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto/cliente/registrarse2/registrarse2_widget.dart';
import 'package:proyecto/models/login.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registrarse1_model.dart';
export 'registrarse1_model.dart';
import 'package:http/http.dart' as http;

class Registrarse1Widget extends StatefulWidget {
  const Registrarse1Widget({Key? key}) : super(key: key);

  @override
  _Registrarse1WidgetState createState() => _Registrarse1WidgetState();
}

class _Registrarse1WidgetState extends State<Registrarse1Widget> {
  late Registrarse1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool areAllFieldsFilled() {
    return _model.codigoRegistrarseController.text.isNotEmpty &&
        _model.nombreRegistrarseController.text.isNotEmpty &&
        _model.apellidopRegistrarseController.text.isNotEmpty &&
        _model.apellidomRegistrarseController.text.isNotEmpty &&
        _model.sexoRegistrarseController.text.isNotEmpty;
  }

  Future<void> fetchPersonaByCodigo(String codigo) async {
    final url = Uri.parse(
        'https://backend-appstudent.onrender.com/api/v1/persona/searchByCode/$codigo');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _model.codigoRegistrarseController.text = jsonData['codigoPersona'];
      _model.nombreRegistrarseController.text = jsonData['nombrePersona'];
      _model.apellidopRegistrarseController.text = jsonData['apellidoPaterno'];
      _model.apellidomRegistrarseController.text = jsonData['apellidoMaterno'];
      _model.sexoRegistrarseController.text = 
          'No especificado'; // Agrega aquí el campo correspondiente
    } else {
      print('Error al buscar la persona por código.');
      // Puedes mostrar un mensaje de error al usuario si lo deseas.
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registrarse1Model());

    _model.codigoRegistrarseController ??= TextEditingController();
    _model.codigoRegistrarseFocusNode ??= FocusNode();

    _model.nombreRegistrarseController ??= TextEditingController();
    _model.nombreRegistrarseFocusNode ??= FocusNode();

    _model.apellidopRegistrarseController ??= TextEditingController();
    _model.apellidopRegistrarseFocusNode ??= FocusNode();

    _model.apellidomRegistrarseController ??= TextEditingController();
    _model.apellidomRegistrarseFocusNode ??= FocusNode();

    _model.sexoRegistrarseController ??= TextEditingController();
    _model.sexoRegistrarseFocusNode ??= FocusNode();
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Image.asset(
                            'assets/images/Rectangle_4.png',
                            width: double.infinity,
                            height: 340.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 80.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120.0,
                                  height: 120.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/HelpStudentsSinCosoBlanco.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ].addToStart(const SizedBox(width: 130.0)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 220.0, 0.0, 0.0),
                            child: Container(
                              width: 300.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFF5998D1),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Text(
                                  'Help student',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fredoka One',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 25.0,
                                        letterSpacing: 4.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'Registrarse',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                33.0, 20.0, 20.0, 16.0),
                            child: Container(
                              width: 300.0,
                              child: TextFormField(
                                controller: _model.codigoRegistrarseController,
                                focusNode: _model.codigoRegistrarseFocusNode,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Codigo',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
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
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent4,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .codigoRegistrarseControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      final codigo = _model
                                          .codigoRegistrarseController.text;
                                      if (codigo.isNotEmpty) {
                                        fetchPersonaByCodigo(codigo);
                                      }
                                    },
                                    text: '',
                                    icon: const Icon(
                                      Icons.person_search,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding: const
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 61.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 16.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.nombreRegistrarseController,
                              focusNode: _model.nombreRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nombre',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model
                                  .nombreRegistrarseControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 74.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 10.0, 8.0, 16.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.apellidopRegistrarseController,
                              focusNode: _model.apellidopRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Apellido Paterno',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model
                                  .apellidopRegistrarseControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 65.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 16.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.apellidomRegistrarseController,
                              focusNode: _model.apellidomRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Apellido materno',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model
                                  .apellidomRegistrarseControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 16.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.sexoRegistrarseController,
                              focusNode: _model.sexoRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Sexo',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              validator: _model
                                  .sexoRegistrarseControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: areAllFieldsFilled()
                                  ? () async {
                                      final storage = FlutterSecureStorage();
                                      // Crear una instancia de UserData con los valores actuales
                                      final userData = Login(
                                        codigo: _model
                                            .codigoRegistrarseController.text,
                                        nombre: _model
                                            .nombreRegistrarseController.text,
                                        apellidoPaterno: _model
                                            .apellidopRegistrarseController
                                            .text,
                                        apellidoMaterno: _model
                                            .apellidomRegistrarseController
                                            .text,
                                        sexo: _model
                                            .sexoRegistrarseController.text,
                                      );

                                      // Convertir el objeto UserData a JSON
                                      final userDataJson = userData.toJson();

                                      // Imprimir el JSON
                                      print('JSON guardado: $userDataJson');

                                      // Guardar el JSON en el almacenamiento seguro
                                      await storage.write(
                                          key: 'userData',
                                          value: jsonEncode(userDataJson));

                                      // Luego, para navegar a la siguiente página (Registrarse2Widget):
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Registrarse2Widget(),
                                        ),
                                      );
                                    }
                                  : null,
                              text: 'Continuar',
                              options: FFButtonOptions(
                                width: 320.0,
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF5998D1),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Fredoka',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                elevation: 3.0,
                                borderSide:const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
