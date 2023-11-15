class Trabajador {
  final int id;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correo;
  final String numeroCelular;

  Trabajador({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.numeroCelular,
  });

  factory Trabajador.fromJson(Map<String, dynamic> json) {
    return Trabajador(
      id: json['id'],
      nombre: json['persona']['nombre'],
      apellidoPaterno: json['persona']['apellidoPaterno'],
      apellidoMaterno: json['persona']['apellidoMaterno'],
      correo: json['persona']['correo'],
      numeroCelular: json['persona']['numeroCelular'],
    );
  }
}