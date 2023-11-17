class Mensaje {
  Mensaje({
    required this.id,
    required this.mensaje,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.estado,
    required this.contratador,
    required this.trabajador,
  });

  int id;
  String mensaje;
  DateTime fechaInicio;
  DateTime? fechaFinal; // Cambiado a DateTime? para manejar valores nulos
  String estado;
  Contratador contratador;
  Trabajador trabajador;

  factory Mensaje.fromJson(Map<String, dynamic> json) {
    return Mensaje(
      id: json['id'],
      mensaje: json['mensaje'],
      fechaInicio: DateTime.parse(json['fechaInicio']),
      fechaFinal: json['fechaFinal'] != null
          ? DateTime.parse(json['fechaFinal'])
          : null,
      estado: json['estado'],
      contratador: Contratador.fromJson(json['contratador']),
      trabajador: Trabajador.fromJson(json['trabajador']),
    );
  }
}

class Contratador {
  int id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  int numeroCelular;
  String correo;

  Contratador({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.numeroCelular,
    required this.correo,
  });

  factory Contratador.fromJson(Map<String, dynamic> json) {
    return Contratador(
      id: json['id'],
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      numeroCelular: json['numeroCelular'],
      correo: json['correo'],
    );
  }
}

class Trabajador {
  int id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  int numeroCelular;
  String correo;

  Trabajador({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.numeroCelular,
    required this.correo,
  });

  factory Trabajador.fromJson(Map<String, dynamic> json) {
    return Trabajador(
      id: json['id'],
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      numeroCelular: json['numeroCelular'],
      correo: json['correo'],
    );
  }
}
