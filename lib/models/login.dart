class Login {
  final String codigo;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String sexo;

  Login({
    required this.codigo,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.sexo,
  });

// Método para convertir la instancia de Login a un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nombre': nombre,
      'apellidoPaterno': apellidoPaterno,
      'apellidoMaterno': apellidoMaterno,
      'sexo': sexo,
    };
  }

  // Método para crear una instancia de Login desde un mapa JSON.
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      codigo: json['codigo'],
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      sexo: json['sexo'],
    );
  }
}
