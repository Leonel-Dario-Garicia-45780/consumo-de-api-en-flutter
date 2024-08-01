//! sin demostrar

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<User> actualizarUsuario(int id, int cedula, String nombre, int telefono, String direccion, String email, String contrasena) async {
  final response = await http.put(
    Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'cedula': cedula,
      'nombre': nombre,
      'telefono': telefono,
      'direccion': direccion,
      'email': email,
      'contraseña': contrasena,
    }),
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al actualizar el usuario: ${response.statusCode}');
  }
}
