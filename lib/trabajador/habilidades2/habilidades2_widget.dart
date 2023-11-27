import 'package:proyecto/trabajador/habilidades1_copy/habilidades1_copy_widget.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'habilidades2_model.dart';
export 'habilidades2_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Habilidades2Widget extends StatefulWidget {
  const Habilidades2Widget({Key? key}) : super(key: key);

  @override
  _Habilidades2WidgetState createState() => _Habilidades2WidgetState();
}

class _Habilidades2WidgetState extends State<Habilidades2Widget>
    with TickerProviderStateMixin {
  late Habilidades2Model _model;
  final _storage = FlutterSecureStorage();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _userName = '';
  List<dynamic> habilidades = []; // Declara esta lista en la clase

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  // Obtener la especialidad guardada en FlutterSecureStorage
  Future<String?> obtenerEspecialidadGuardada() async {
    try {
      return await _storage.read(key: 'especialidad');
    } catch (e) {
      print('Error al obtener la especialidad: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Error al obtener la especialidad. Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 3),
        ),
      );
      return null;
    }
  }

  // Obtener las habilidades según la especialidad de la API
  Future<List<dynamic>> obtenerHabilidadesPorEspecialidad(
      String especialidad) async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');
      String? codigo;

      if (token != null) {
        final parts = token.split('.');
        if (parts.length == 3) {
          final payload = json.decode(
            utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
          );
          if (payload is Map) {
            codigo = payload['codigo'];
          }
        }
      }

      if (codigo == null) {
        throw Exception('Código no encontrado');
      }

      final url = Uri.parse(
        'https://nestjs-pi-postgres.onrender.com/api/v1/habilidades/por-especialidad/$especialidad/$codigo',
      );

      try {
        final response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          List<dynamic> habilidades = jsonData['habilidades'];
          return habilidades;
        } else {
          print('Error al cargar las habilidades: ${response.statusCode}');
          return [];
        }
      } catch (e) {
        print('Error: $e');
        return [];
      }
    } catch (e) {
      print('Error al cargar las habilidades: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error al cargar las habilidades. Por favor, inténtalo de nuevo.',
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Habilidades2Model());
    _getUserNameFromToken();
    // Obtener la especialidad guardada al iniciar la página
    obtenerEspecialidadGuardada().then((especialidadGuardada) {
      if (especialidadGuardada != null) {
        print('La especialidad guardada es: $especialidadGuardada');
        obtenerHabilidadesPorEspecialidad(especialidadGuardada)
            .then((listaHabilidades) {
          if (listaHabilidades.isNotEmpty) {
            setState(() {
              habilidades = listaHabilidades;
            });
          } else {
            print(
                'No se encontraron habilidades para la especialidad $especialidadGuardada');
          }
        });
      } else {
        print('No se encontró ninguna especialidad almacenada.');
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  // Función para obtener el nombre de usuario desde el token
  Future<void> _getUserNameFromToken() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    if (token != null) {
      final parts = token.split('.');
      if (parts.length == 3) {
        final payload = json.decode(
            utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
        if (payload is Map) {
          final codigo =
              payload['codigo']; // Asegúrate de usar la clave correcta
          print('Código extraído del token: $codigo');

          // Asigna el valor de codigo a codigoPersona
          String codigoPersona =
              codigo; // Reemplaza el tipo de dato según sea necesario

          // Realiza una solicitud a la API para buscar a la persona por código
          final apiUrl =
              'https://nestjs-pi-postgres.onrender.com/api/v1/personas/searchByCode/$codigo';
          final response = await http.get(Uri.parse(apiUrl));

          if (response.statusCode == 200) {
            final personaData = json.decode(response.body);
            final nombre = personaData['nombre'];

            setState(() {
              _userName = '$nombre'; //Aca va nombre y apellido que se mostrará
            });
          }
        }
      }
    }
  }

  Future<void> agregarHabilidad(String habilidad) async {
    // Crear los datos para la solicitud POST
    final datos = {
      'persona': _userName,
      'habilidad': habilidad,
    };

    // Imprimir el JSON antes de enviarlo a la API
    print('JSON enviado a la API: ${json.encode(datos)}');

    // Realizar la solicitud POST
    final response = await http.post(
      Uri.parse(
          'https://nestjs-pi-postgres.onrender.com/api/v1/habilidad-personas'),
      body: json.encode(datos),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Si la solicitud se realizó correctamente, actualizar la lista de habilidades
    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Habilidad Agregada'),
            content: Text('Habilidad agregada satisfactoriamente!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 400) {
      // En caso de BadRequest (código 400), mostrar una alerta
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Habilidad duplicada'),
            content: Text('Esta habilidad ya ha sido seleccionada.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
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
              final _storage = FlutterSecureStorage();
              await _storage.delete(key: 'especialidad');

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Habilidades1CopyWidget(),
                ),
              );
            },
          ),
          title: Text(
            'Habilidades',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Container(
                width: 395.0,
                height: 621.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: habilidades.map((habilidad) {
                    print(
                        'Tipo de habilidad[\'nombre\']: ${habilidad['nombre'].runtimeType}');
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 5.0),
                      child: Container(
                        width: double.infinity,
                        height: 79.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x32171717),
                              offset: Offset(0.0, 3.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        habilidad['nombre'],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        final index = habilidades.indexOf(
                                            habilidad); // Get the index of the selected habilidad
                                        final habilidadNombre = habilidad[
                                            'nombre']; // Get the habilidad name from the selected habilidad
                                        agregarHabilidad(
                                          habilidadNombre,
                                        ); // Pass the index and habilidad name to agregarHabilidad
                                      },
                                      text: '+',
                                      options: FFButtonOptions(
                                        width: 40.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation7']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
