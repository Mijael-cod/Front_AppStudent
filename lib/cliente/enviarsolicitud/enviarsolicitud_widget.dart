import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto/cliente/home_cliente/home_cliente_widget.dart';
import 'package:proyecto/models/trabajador.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'enviarsolicitud_model.dart';
export 'enviarsolicitud_model.dart';

import 'package:http/http.dart' as http;

class EnviarsolicitudWidget extends StatefulWidget {
  const EnviarsolicitudWidget({Key? key}) : super(key: key);

  @override
  _EnviarsolicitudWidgetState createState() => _EnviarsolicitudWidgetState();
}

class _EnviarsolicitudWidgetState extends State<EnviarsolicitudWidget> {
  late EnviarsolicitudModel _model;

  Persona? persona;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final storage = FlutterSecureStorage();
  String? codigoPersona;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnviarsolicitudModel());

    loadCodigoPersona();

    _model.comentarSolicitudController ??= TextEditingController();
    _model.comentarSolicitudFocusNode ??= FocusNode();
  }

  Future<Map<String, dynamic>> loadCodigoPersona() async {
    codigoPersona = await storage.read(key: 'codigoPersona');

    if (codigoPersona != null) {
      final apiUrl =
          'https://nestjs-pi-postgres.onrender.com/api/v1/personas/searchByCode/$codigoPersona';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Si el servidor devuelve una respuesta OK, parseamos el JSON
        Map<String, dynamic> jsonPersona = jsonDecode(response.body);
        // Asignamos los datos de la persona a la variable de estado
        setState(() {
          persona = Persona.fromJson(jsonPersona);
        });
        return jsonPersona; // Devolvemos el jsonPersona
      } else {
        // Si la respuesta no es OK, lanzamos un error
        throw Exception('Failed to load persona');
      }
    }
    return {}; // Devolvemos un Map vacío si codigoPersona es null
  }

  Future<void> enviarSolicitud(
      String mensaje, String codigoPersonaDestino) async {
    // Obtenemos el token
    String? token = await storage.read(key: 'token');

    if (token != null) {
      // Decodificamos el token
      List<String> parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token');
      }

      var payload =
          jsonDecode(utf8.decode(base64.decode(base64.normalize(parts[1]))));
      String? codigoPersona = payload[
          'codigo']; // Asume que el código de la persona está en la propiedad 'codigo' del payload

      if (codigoPersona != null) {
        final apiUrl =
            'https://nestjs-pi-postgres.onrender.com/api/v1/solicitud/';

        // Creamos el cuerpo de la solicitud
        final body = {
          'mensaje': mensaje,
          'contratador': codigoPersona,
          'trabajador': codigoPersonaDestino,
        };

        // Hacemos la solicitud POST
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body),
        );

        if (response.statusCode == 201) {
          // Si el servidor devuelve una respuesta OK, la solicitud se envió correctamente
          print('Solicitud enviada correctamente');
        } else {
          // Si la respuesta no es OK, lanzamos un error
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
          throw Exception('Failed to send solicitud');
        }
      }
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                Icons.arrow_back_rounded,
                color: Color(0xFF5998D1),
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 2.0, 2.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/blank-profile-picture-973460_1280.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${persona?.nombre} \n${persona?.apellidoPaterno} ${persona?.apellidoMaterno}',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                ),
                          ),
                          RatingBar.builder(
                            onRatingUpdate: (newValue) => setState(
                                () => _model.ratingBarValue = newValue),
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            direction: Axis.horizontal,
                            initialRating: _model.ratingBarValue ??= 3.0,
                            unratedColor: FlutterFlowTheme.of(context).accent3,
                            itemCount: 5,
                            itemSize: 30.0,
                            glowColor: FlutterFlowTheme.of(context).tertiary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 25.0, 12.0),
                  child: TextFormField(
                    controller: _model.comentarSolicitudController,
                    focusNode: _model.comentarSolicitudFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.comentarSolicitudController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText:
                          'Ejemplo: Requiero su habilidad de edición de video por 2 horas, estoy dispuesto a pagar 20 soles la hora',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                fontFamily: 'Inter',
                                color: Color(0x70929090),
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge,
                    textAlign: TextAlign.justify,
                    maxLines: 7,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model.comentarSolicitudControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(70.0, 8.0, 16.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          String mensaje =
                              _model.comentarSolicitudController.text;
                          Map<String, dynamic> personaDestino =
                              await loadCodigoPersona();
                          String codigoPersonaDestino = personaDestino[
                              'codigo']; // Obtén el código de la persona destino

                          Map<String, dynamic> solicitudInfo = {
                            'mensaje': mensaje,
                            'codigoPersona': await storage.read(
                                key:
                                    'contratador'), // Asume que este es el código de la persona que envía la solicitud
                            'codigoPersonaDestino': codigoPersonaDestino,
                          };

                          print(
                              'Información de la solicitud: ${jsonEncode(solicitudInfo)}');

                     try {
  await enviarSolicitud(mensaje, codigoPersonaDestino);
  print('BotonEnviar pressed ...');

  // Limpia el mensaje del Secure Storage
  await storage.delete(key: 'codigoPersona');

  // Redirige al usuario al HomeClienteWidget
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeClienteWidget()),
  );
} catch (e, s) {
  print('Error al enviar la solicitud: $e');
  print('Stack trace: $s');
  // Aquí puedes mostrar un mensaje al usuario para informarle que la solicitud no se pudo enviar
}
                        },
                        text: 'Enviar',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 32.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pop();
                        },
                        text: 'Cancelar',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
