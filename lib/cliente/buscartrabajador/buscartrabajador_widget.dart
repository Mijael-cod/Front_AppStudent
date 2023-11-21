import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto/models/trabajador.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buscartrabajador_model.dart';
export 'buscartrabajador_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class BuscartrabajadorWidget extends StatefulWidget {
  const BuscartrabajadorWidget({Key? key}) : super(key: key);

  @override
  _BuscartrabajadorWidgetState createState() => _BuscartrabajadorWidgetState();
}

class _BuscartrabajadorWidgetState extends State<BuscartrabajadorWidget>
    with TickerProviderStateMixin {
  late BuscartrabajadorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscartrabajadorModel());

    _model.buscarTrabajadorController ??= TextEditingController(text: 'que');
    _model.buscarTrabajadorFocusNode ??= FocusNode();
  }

  Future<List<Trabajador>> fetchTrabajadores() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    if (token != null) {
      final parts = token.split('.');
      if (parts.length == 3) {
        final payload = json.decode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
        );
        if (payload is Map) {
          final codigo = payload['codigo'];
          print('Código extraído del token: $codigo');

          final url =
              'https://nestjs-pi-postgres.onrender.com/api/v1/habilidad-personas/except/$codigo';
          final response = await http.get(Uri.parse(url));

          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');

          if (response.statusCode == 200) {
            Map<String, dynamic> jsonResponse = json.decode(response.body);
            if (jsonResponse.containsKey('skills')) {
              List skills = jsonResponse['skills'];
              return skills.map((item) => Trabajador.fromJson(item)).toList();
            } else {
              throw Exception('Response does not contain the expected data');
            }
          } else {
            throw Exception('Failed to load trabajadores');
          }
        }
      }
    }
    // Manejar el caso donde el token no está presente o no es válido
    // Puede retornar una lista vacía o manejar otro comportamiento según sea necesario
    return [];
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 48.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF5998D1),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('HomeCliente');
                },
              ),
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
              child: Text(
                'Buscar servicios',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.buscarTrabajadorController,
                  focusNode: _model.buscarTrabajadorFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          fontSize: 18.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                      ),
                  maxLines: null,
                  validator: _model.buscarTrabajadorControllerValidator
                      .asValidator(context),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Trabajador>>(
                  future: fetchTrabajadores(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Trabajador>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No hay datos disponibles.'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Trabajador trabajador = snapshot.data![index];

                          int calificacion = trabajador.persona
                              .calificacion; // Supongamos que la calificación está almacenada en cada objeto Trabajador

                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    offset: Offset(0.0, 1.0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.network(
                                    trabajador.persona
                                        .foto, // Utiliza la URL de la imagen del trabajador
                                  ),
                                ),
                                title: Text(
                                  '${trabajador.persona.nombre} ${trabajador.persona.apellidoPaterno} ${trabajador.persona.apellidoMaterno}',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${trabajador.habilidad.nombre}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 80),
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            crossAxisSpacing: 0,
                                            mainAxisSpacing: 0,
                                            mainAxisExtent: 25,
                                          ),
                                          itemCount: 5,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            String cali =
                                                "assets/images/e-color.png";

                                            if (calificacion >= (index + 1)) {
                                              cali =
                                                  "assets/images/e-color.png";
                                            } else {
                                              cali =
                                                  "assets/images/e-sincolor.png";
                                            }
                                            return Image.asset(
                                              cali,
                                              width: 40,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onTap: () async {
                                  // Acción al hacer clic en un elemento de la lista
                                  // Puedes navegar a la página de detalle o realizar otras acciones

                                  // Guardar el código de la persona en el almacenamiento seguro
                                  final storage = FlutterSecureStorage();
                                  await storage.write(
                                      key: 'codigoPersona',
                                      value:
                                          trabajador.persona.codigo.toString());

                                  context.pushNamed('visualizarperfil');
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
