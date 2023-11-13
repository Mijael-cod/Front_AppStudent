import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {

  Future<String?> login(String codigo, String password) async {
    final url =
        Uri.parse('https://nest-pi-postgres-v2.onrender.com/api/v1/auth/login');
    final response =
        await http.post(url, body: 
        {'codigo': codigo, 
        'password': password});

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final token = data['token'];
      return token;
    } else {
      return null;
    }

  }

}
