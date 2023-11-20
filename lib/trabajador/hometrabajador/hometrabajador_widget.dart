import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto/alertas/alertas.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hometrabajador_model.dart';
export 'hometrabajador_model.dart';
import 'package:http/http.dart' as http;

class HometrabajadorWidget extends StatefulWidget {
  const HometrabajadorWidget({Key? key}) : super(key: key);

  @override
  _HometrabajadorWidgetState createState() => _HometrabajadorWidgetState();
}

class _HometrabajadorWidgetState extends State<HometrabajadorWidget>
    with TickerProviderStateMixin {
  late HometrabajadorModel _model;

  late List<dynamic> data = []; // Inicializar con una lista vacía

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String codigoperso = '';
  String _userName = ''; // Variable para almacenar el nombre de usuario

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
          begin: Offset(0.0, 30.0),
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
          begin: Offset(0.0, 30.0),
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
          begin: Offset(0.0, 30.0),
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
          begin: Offset(0.0, 30.0),
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
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HometrabajadorModel());

    // Decodificar el token y obtener el nombre
    _getUserNameFromToken();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.comentarioTrabajadorController1 ??= TextEditingController();
    _model.comentarioTrabajadorFocusNode1 ??= FocusNode();

    _model.comentarioTrabajadorController2 ??= TextEditingController();
    _model.comentarioTrabajadorFocusNode2 ??= FocusNode();

    _model.comentarioTrabajadorController3 ??= TextEditingController();
    _model.comentarioTrabajadorFocusNode3 ??= FocusNode();

    _model.comentarioTrabajadorController4 ??= TextEditingController();
    _model.comentarioTrabajadorFocusNode4 ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  //Funcion para listar las solicitudes pendientes
  Future<dynamic> UpdateState(String estado, int id) async {
    final response = await http.patch(
      Uri.parse(
          'https://nestjs-pi-postgres.onrender.com/api/v1/solicitud/actualizarEstado/$id'),
      headers: {},
      body: {
        "nuevoEstado": estado,
      },
    );

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, analiza los datos JSON
      final dataResult = json.decode(response.body);
      return dataResult;
    } else {
      // Si la solicitud no fue exitosa, lanza una excepción
      throw Exception('Error al cargar los datos');
    }
  }

  //Funcion para listar las solicitudes pendientes
  Future<List<dynamic>> fetchData(String codigoPersona) async {
    final response = await http.get(
      Uri.parse(
          'https://nestjs-pi-postgres.onrender.com/api/v1/solicitud/en-espera/$codigoPersona'),
    );

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, analiza los datos JSON
      final dataResult = json.decode(response.body);
      final datita = List<dynamic>.from(dataResult);
      setState(() {
        data = datita;
      });
      data = datita;
      print("Resul/");
      print(data);
      return data;
    } else {
      // Si la solicitud no fue exitosa, lanza una excepción
      throw Exception('Error al cargar los datos');
    }
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
          String codigoPersona = codigo;
          // Reemplaza el tipo de dato según sea necesario
          codigoperso = codigoPersona;

          // Realiza una solicitud a la API con el códigoPersona
          fetchData(codigoPersona).then((result) {
            setState(() {
              data = result;
            });
          }).catchError((error) {
            // Maneja el error, por ejemplo, muestra un mensaje de error.
            print('Error: $error');
          });

          // Realiza una solicitud a la API para buscar a la persona por código
          final apiUrl =
              'https://nestjs-pi-postgres.onrender.com/api/v1/personas/searchByCode/$codigo';
          final response = await http.get(Uri.parse(apiUrl));

          if (response.statusCode == 200) {
            final personaData = json.decode(response.body);
            final nombre =
                personaData['nombre']; // Asegúrate de usar la clave correcta
            final apellidoPaterno = personaData['apellidoPaterno'];
            final apellidoMaterno = personaData['apellidoMaterno'];

            setState(() {
              _userName = '$nombre'; //Aca va nombre y apellido que se mostrará
            });
          }
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

    print("Cuentas ${data.length}");

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(127.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 15.0, 6.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('perfiltrabajador');
                            },
                            child: Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32.0),
                                child: Image.asset(
                                  'assets/images/blank-profile-picture-973460_1280.png',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 30.0, 30.0, 0.0),
                              child: Text(
                                'Hola, $_userName',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 30.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('calificar');
                            },
                            child: Icon(
                              Icons.star_rate,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StickyHeader(
                  overlapHeaders: false,
                  header: Container(
                    width: double.infinity,
                    height: 25.0,
                    decoration: BoxDecoration(),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 12.0),
                              child: Text(
                                'Ofertas',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 44.0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: 220.0,
                                      height: 648.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                isScrollable: true,
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                        ),
                                                unselectedLabelStyle:
                                                    TextStyle(),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                indicatorWeight: 2.0,
                                                tabs: [
                                                  Tab(
                                                    text: 'Pendiente',
                                                  ),
                                                  Tab(
                                                    text: 'Completados',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 1,
                                                        crossAxisSpacing: 20,
                                                        mainAxisSpacing: 15,
                                                        mainAxisExtent: 430,
                                                      ),
                                                      shrinkWrap: true,
                                                      itemCount: data.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        dynamic p = data[index];
                                                        int calificacion = p[
                                                                'contratador']
                                                            ['calificacion'];

                                                        // Verificar que 'p' sea un mapa y que contenga 'mensaje'
                                                        if (p is Map<String,
                                                                dynamic> &&
                                                            p.containsKey(
                                                                'mensaje')) {
                                                          // Verificar que 'mensaje' sea una cadena
                                                          if (p['mensaje']
                                                              is String) {
                                                            print(p['mensaje']);

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            12)),
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 100,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade600,
                                                                          borderRadius:
                                                                              const BorderRadius.all(
                                                                            Radius.circular(200),
                                                                          ),
                                                                        ),
                                                                        child: Image.network(
                                                                            "https://firebasestorage.googleapis.com/v0/b/py-helpstudent-vi.appspot.com/o/usuarios%2FPERFIL.png?alt=media&token=829020d2-303b-4f96-8e4e-fb3b7e637954"),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 40,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              80),
                                                                      child: GridView.builder(
                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                5,
                                                                            crossAxisSpacing:
                                                                                0,
                                                                            mainAxisSpacing:
                                                                                0,
                                                                            mainAxisExtent:
                                                                                25,
                                                                          ),
                                                                          itemCount: 5,
                                                                          itemBuilder: (BuildContext context, index) {
                                                                            String
                                                                                cali =
                                                                                "assets/images/e-color.png";

                                                                            if (p['contratador']['calificacion'] >=
                                                                                (index + 1)) {
                                                                              cali = "assets/images/e-color.png";
                                                                            } else {
                                                                              cali = "assets/images/e-sincolor.png";
                                                                            }
                                                                            print("ESTE ES EL MENSAJE $cali $index $calificacion ");
                                                                            return Image.asset(cali,
                                                                                width: 40);
                                                                          }),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    p['contratador']
                                                                        [
                                                                        'nombre'],
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      // decoration: TextDecoration.lineThrough  //Esto sirve para ponerle rayita al texto
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            80),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: 1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Text(p[
                                                                      'mensaje']),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            80),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: 1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                          width:
                                                                              30),
                                                                      Expanded(
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await UpdateState("pendientes",
                                                                                p['id']);
                                                                            await fetchData(codigoperso);
                                                                            ScaffoldMessenger.of(context)
                                                                              ..hideCurrentSnackBar()
                                                                              ..showSnackBar(
                                                                                successToastAlertDialog(
                                                                                  "Se ha aceptado tu solicitud por ser seguidor de Reyna :D...!!!",
                                                                                ),
                                                                              );
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                          ),
                                                                          child:
                                                                              Text("Aceptar"),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              20),
                                                                      Expanded(
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await UpdateState("cancelado",
                                                                                p['id']);
                                                                            await fetchData(codigoperso);
                                                                            ScaffoldMessenger.of(context)
                                                                              ..hideCurrentSnackBar()
                                                                              ..showSnackBar(
                                                                                errorToastAlertDialog(
                                                                                  "Se ha cancelado tu solicitud por ser seguidor de Reyna :D...!!!",
                                                                                ),
                                                                              );
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            "Cancelar",
                                                                            style:
                                                                                TextStyle(color: Colors.grey.shade500),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              30),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        // Manejar el caso en el que 'mensaje' no está presente o no es una cadena
                                                        return Container();
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
