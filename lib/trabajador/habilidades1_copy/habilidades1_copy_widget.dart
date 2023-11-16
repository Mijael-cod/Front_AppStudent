import 'package:proyecto/index.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'habilidades1_copy_model.dart';
export 'habilidades1_copy_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Habilidades1CopyWidget extends StatefulWidget {
  const Habilidades1CopyWidget({Key? key}) : super(key: key);

  @override
  _Habilidades1CopyWidgetState createState() => _Habilidades1CopyWidgetState();
}

class _Habilidades1CopyWidgetState extends State<Habilidades1CopyWidget> {
  late Habilidades1CopyModel _model;
  final _storage = FlutterSecureStorage();

  List<String> categorias = [];

  List<String> especialidades = [];
  String selectedCategoria = '';

// Función para obtener las categorías desde la API
  Future<List<String>> obtenerCategorias() async {
    final response = await http.get(
        Uri.parse('https://nestjs-pi-postgres.onrender.com/api/v1/categoria'));

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final List<dynamic> categoriasJson = json.decode(response.body);

      // Mapear el JSON para obtener solo los nombres de las categorías
      final List<String> nombresCategorias = categoriasJson
          .map((categoria) => categoria['nombre'] as String)
          .toList();
      print(nombresCategorias);
      return nombresCategorias;
    } else {
      throw Exception('Error al cargar las categorías');
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    obtenerCategorias().then((listaCategorias) {
      setState(() {
        categorias = listaCategorias;
      });
    }).catchError((error) {
      print('Error: $error');
    });
    _model = createModel(context, () => Habilidades1CopyModel());
  }

  // Función para obtener especialidades según la categoría seleccionada
  Future<void> obtenerEspecialidades(String categoriaSeleccionada) async {
    final response = await http.get(Uri.parse(
        'https://nestjs-pi-postgres.onrender.com/api/v1/especialidad/searchByCategory/$categoriaSeleccionada'));

    if (response.statusCode == 200) {
      final especialidadesJson = json.decode(response.body)['especialidad'];

      setState(() {
        especialidades = especialidadesJson
            .map<String>((especialidad) => especialidad['nombre'] as String)
            .toList();
      });
    } else {
      throw Exception('Error al cargar las especialidades');
    }
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
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
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 395.0,
              height: 702.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.selectCategoriaValueController ??=
                          FormFieldController<String>(null),
                      options: categorias.isNotEmpty
                          ? categorias
                          : [
                              'Cargando...'
                            ], // Utiliza las categorías obtenidas de la API o muestra "Cargando..." mientras se cargan
                      onChanged: (val) => setState(() {
                        selectedCategoria = val ?? '';
                        // Llamar función para obtener las especialidades según la categoría seleccionada
                        obtenerEspecialidades(selectedCategoria);
                      }),
                      width: 300.0,
                      height: 60.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontSize: 16.0,
                              ),
                      hintText: 'Seleccionar una categoria',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF5998D1),
                        size: 30.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.selectEspecialidadValueController ??=
                          FormFieldController<String>(null),
                      options: especialidades.isNotEmpty
                          ? especialidades
                          : ['Selecciona una categoría primero'],
                      onChanged: (val) =>
                          setState(() => _model.selectEspecialidadValue = val),
                      width: 300.0,
                      height: 60.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontSize: 16.0,
                              ),
                      hintText: 'Selecciona una especialidad',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF5998D1),
                        size: 30.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 281.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                90.0, 40.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.selectEspecialidadValue != null &&
                                    _model
                                        .selectEspecialidadValue!.isNotEmpty) {
                                  // Guardar la especialidad seleccionada en Secure Storage
                                  await _storage.write(
                                      key: 'especialidad',
                                      value: _model.selectEspecialidadValue);

                                  // Navegar a la siguiente pantalla (habilidades2)
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Habilidades2Widget(),
                                    ),
                                  );
                                }
                              },
                              text: 'Aceptar',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
