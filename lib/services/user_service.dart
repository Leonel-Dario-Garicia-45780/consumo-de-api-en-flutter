import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> consultarUsuarios() async {
  final response = await http
      .get(Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar los usuarios');
  }
}

// Future<User> createUsuarios(
//   int cedula,
//   String nombre,
//   int telefono,
//   String direccion,
//   String email,
//   String contrasena,
// ) async {
//   final response = await http.post(
//     Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       "cedula": cedula,
//       "nombre": nombre,
//       "telefono": telefono,
//       "email": email,
//       "direccion": direccion,
//       "contrasena": contrasena,
//     }),
//   );

//   if (response.statusCode == 201) {
//     return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('No se pudo registrar');
//   }
// }
