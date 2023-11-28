import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto/cliente/login/login_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registrarse2_model.dart';
export 'registrarse2_model.dart';
import 'package:http/http.dart' as http;

class Registrarse2Widget extends StatefulWidget {
  const Registrarse2Widget({Key? key}) : super(key: key);

  @override
  _Registrarse2WidgetState createState() => _Registrarse2WidgetState();
}

class _Registrarse2WidgetState extends State<Registrarse2Widget> {
  late Registrarse2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> passwordsMatch() async {
    final storage = FlutterSecureStorage();

    final password1 = _model.passwordRegistrarseController.text;
    final password2 = _model.passwordRegistrarseRepiController.text;

    if (password1 == password2 &&
        password1.length >= 6 &&
        password2.length >= 6) {
      String email = _model.emailRegistrarseController.text;
      String telefono = _model.telefonoRegistrarseController.text;

      // Crear un mapa con los nuevos datos
      Map<String, String> newUserData = {
        'correo': email,
        'numeroCelular': telefono,
        'password':
            password1, // Usamos password1 o password2 ya que son iguales
      };

      // Leer los datos existentes del almacenamiento seguro
      String? existingUserDataJson = await storage.read(key: 'userData');

      // Convertir la cadena JSON a un mapa
      Map<String, dynamic> existingUserData =
          existingUserDataJson != null ? jsonDecode(existingUserDataJson) : {};

      // Combinar los mapas
      existingUserData..addAll(newUserData);

      // Convertir el mapa resultante a una cadena JSON
      String combinedUserDataJson = jsonEncode(existingUserData);

      // Imprimir el JSON combinado
      print('JSON combinado: $combinedUserDataJson');

      // Crear la solicitud POST
      var response = await http.post(
        Uri.parse(
            'https://nest-pi-postgres-v2.onrender.com/api/v1/auth/register'), // Reemplaza con la URL de tu API
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: combinedUserDataJson,
      );

      if (response.statusCode == 201) {
        // Si el servidor devuelve una respuesta OK, parseamos el JSON.
        print('Datos enviados con éxito');
      } else {
        // Si el servidor devuelve una respuesta que no es OK, lanzamos una excepción.
        print('Error al enviar los datos: ${response.statusCode}');
      }

      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registrarse2Model());

    _model.emailRegistrarseController ??= TextEditingController();
    _model.emailRegistrarseFocusNode ??= FocusNode();

    _model.telefonoRegistrarseController ??= TextEditingController();
    _model.telefonoRegistrarseFocusNode ??= FocusNode();

    _model.passwordRegistrarseController ??= TextEditingController();
    _model.passwordRegistrarseFocusNode ??= FocusNode();

    _model.passwordRegistrarseRepiController ??= TextEditingController();
    _model.passwordRegistrarseRepiFocusNode ??= FocusNode();
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
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 7.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 83.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 20.0, 8.0, 16.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.emailRegistrarseController,
                              focusNode: _model.emailRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
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
                              keyboardType: TextInputType.emailAddress,
                              validator: _model
                                  .emailRegistrarseControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                35.0, 20.0, 35.0, 5.0),
                            child: Container(
                              width: 300.0,
                              child: TextFormField(
                                controller:
                                    _model.telefonoRegistrarseController,
                                focusNode: _model.telefonoRegistrarseFocusNode,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Telefono',
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
                                maxLength: 9,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .telefonoRegistrarseControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 75.0,
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
                              controller: _model.passwordRegistrarseController,
                              focusNode: _model.passwordRegistrarseFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText:
                                  !_model.passwordRegistrarseVisibility,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordRegistrarseVisibility =
                                        !_model.passwordRegistrarseVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordRegistrarseVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              validator: _model
                                  .passwordRegistrarseControllerValidator
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
                        height: 78.0,
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
                              controller:
                                  _model.passwordRegistrarseRepiController,
                              focusNode:
                                  _model.passwordRegistrarseRepiFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText:
                                  !_model.passwordRegistrarseRepiVisibility,
                              decoration: InputDecoration(
                                labelText: 'Confirmar contraseña',
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model
                                            .passwordRegistrarseRepiVisibility =
                                        !_model
                                            .passwordRegistrarseRepiVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordRegistrarseRepiVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                  ),
                              validator: _model
                                  .passwordRegistrarseRepiControllerValidator
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
                              offset: const Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 5.0, 0.0, 5.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    bool passwordsMatchResult =
                                        await passwordsMatch();

                                    if (passwordsMatchResult) {
                                      // Las contraseñas coinciden, puedes continuar con el registro
                                      // Agrega aquí la lógica para continuar con el registro.
                                      // Luego, para navegar a la siguiente página (Registrarse2Widget):
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const LoginWidget(),
                                        ),
                                      );
                                    } else {
                                      // Muestra las alertas según las validaciones fallidas
                                      if (_model.passwordRegistrarseController
                                                  .text.length <
                                              6 &&
                                          _model.passwordRegistrarseRepiController
                                                  .text.length <
                                              6) {
                                        // Contraseña menor a 6 caracteres
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const
                                                  Text('Contraseña muy corta'),
                                              content: const Text(
                                                  'La contraseña debe tener al menos 6 caracteres.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Cierra el cuadro de diálogo
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        // Contraseñas no coinciden
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Contraseñas incorrectas'),
                                              content: const Text(
                                                  'Las contraseñas no coinciden. Por favor, verifica las contraseñas e inténtalo de nuevo.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Cierra el cuadro de diálogo
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  text: 'Registrarse',
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
                                    borderSide: const BorderSide(
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
                      ),
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
