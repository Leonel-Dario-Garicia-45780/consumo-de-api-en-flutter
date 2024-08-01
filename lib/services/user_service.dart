import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> consultarUsuarios() async {
  final response = await http
     .get(Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios'));
      // .get(Uri.parse('https:10.185.81.117/api/usuarios'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar los usuarios');
  }
}


