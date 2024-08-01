class User {
  final int cedula;
  final String nombre;
  final int telefono;
  final String direccion;
  final String email;
  final String contrasena;

  const User({
    required this.cedula,
    required this.nombre,
    required this.telefono,
    required this.direccion,
    required this.email,
    required this.contrasena,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cedula:     json['cedula'],
      nombre:     json['nombre'],
      telefono:   json['telefono'],
      direccion:  json['direccion'],
      email:      json['email'],
      contrasena: json['contraseña'],
    );
  }
  // Getter para cedula
  int get id => cedula;// cedula es el id, pues es irrepetible en el backend
}


