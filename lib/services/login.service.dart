import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {

  Future<String?> login(String codigo, String password) async {
    final url =
        Uri.parse('https://nestjs-pi-postgres.onrender.com/api/v1/auth/login');
        
      print("codigo: " + codigo + "password: " + password);
    try {
      final response =
          await http.post(url, body: {'codigo': codigo, 'password': password});
    print("codigo: " + codigo + "password: " + password);
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        final token = data['token'];
        return token;
      } else {
        return null;
      }
    } catch (e) {
      print("codigo: " + codigo + "password: " + password);
      // Manejo de errores - puedes imprimir el error o realizar alguna otra acción
      print('Error en la solicitud HTTP: $e');
      return null;
    }
  }
}
