class User {
  final int cedula;
  final String nombre;
  final int telefono;
  final String direccion;
  final String email;
  final String contrasena;
/*   final String contraseña; */

  const User({
    required this.cedula,
    required this.nombre,
    required this.telefono,
    required this.direccion,
    required this.email,
    required this.contrasena,
/*     required this.contraseña, */
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cedula:     json['cedula'],
      nombre:     json['nombre'],
      telefono:   json['telefono'],
      direccion:  json['direccion'],
      email:      json['email'],
      contrasena: json['contraseña'],
/*       contraseña: json['contraseña'], */
    );
  }
}
