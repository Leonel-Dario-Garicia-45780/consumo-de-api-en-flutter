// import 'dart:convert';
// import 'package:consumo_de_api/models/user.dart';
// import 'package:http/http.dart' as http;


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
//     // body: jsonEncode(<String, String>{
//     //   "cedula": cedula,
//     //   "nombre": nombre,
//     //   "telefono": telefono,
//     //   "email": email,
//     //   "direccion": direccion,
//     //   "contrasena": contrasena,
//     // }
//     body: jsonEncode(<String, dynamic>{
//       "cedula": cedula,
//       "nombre": nombre,
//       "telefono": telefono,
//       "email": email,
//       "direccion": direccion,
//       "contraseña": contrasena,
//     }
//     ),
//   );

//   if (response.statusCode == 201) {
//     return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('No se pudo registrar');
//   }
// }


import 'dart:convert';
import 'package:consumo_de_api/models/user.dart';
import 'package:http/http.dart' as http;

Future<User> createUsuarios(int cedula, String nombre, int telefono, String direccion, String email, String contrasena) async {
  final response = await http.post(
    Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios'),
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

  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al crear el usuario: ${response.statusCode}');
  }
}
