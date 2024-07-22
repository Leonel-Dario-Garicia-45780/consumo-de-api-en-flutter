import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> consultarUsuarios() async {
  final response =
      await http.get(Uri.parse('https://api-js-5wen.onrender.com/api/user'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Error al cargar los usuarios');
  }
}

class Users {
  final String name;
  final String email;

  const Users({
    required this.name,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'],
      email: json['email'],
    );
  }
}











































/* import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAlbum() async {
  final response = await http.get(Uri.parse(''));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("hubo una falla");
  }
}

class Usuario {
  final cedula;
  final nombre;
  final telefono;
  final direccion;
  final email;

  const Usuario({
    required this.cedula,
    required this.nombre,
    required this.telefono,
    required this.direccion,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      cedula: json['cedula'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      direccion: json['direccion'],
      email: json['email'],
    );
  }
}
 */