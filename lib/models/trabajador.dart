class Trabajador {
  final int id;
  final Persona persona;
  final Habilidad habilidad;

  Trabajador({
    required this.id,
    required this.persona,
    required this.habilidad,
  });

  factory Trabajador.fromJson(Map<String, dynamic> json) {
    return Trabajador(
      id: json['id'],
      persona: Persona.fromJson(json['persona']),
      habilidad: Habilidad.fromJson(json['habilidad']),
    );
  }
}

class Persona {
  final int id;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correo;
  final String numeroCelular;
  final String codigo;
  final String foto;
  final int calificacion;

  Persona({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.numeroCelular,
    required this.codigo,
    required this.foto,
    required this.calificacion,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'],
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      correo: json['correo'],
      numeroCelular: json['numeroCelular'],
      codigo: json['codigo'],
      foto: json['foto'],
      calificacion: json['calificacion'],
    );
  }
}

class Especialidad {
  final int id;
  final String nombre;

  Especialidad({
    required this.id,
    required this.nombre,
  });

  factory Especialidad.fromJson(Map<String, dynamic> json) {
    return Especialidad(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}

class Habilidad {
  final int id;
  final String nombre;
  final Especialidad especialidad;

  Habilidad({
    required this.id,
    required this.nombre,
    required this.especialidad,
  });

  factory Habilidad.fromJson(Map<String, dynamic> json) {
    return Habilidad(
      id: json['id'],
      nombre: json['nombre'],
      especialidad: Especialidad.fromJson(json['especialidad']),
    );
  }
}