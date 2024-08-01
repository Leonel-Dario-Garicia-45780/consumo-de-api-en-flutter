//! sin demostrar
import 'package:http/http.dart' as http;

Future<void> eliminarUsuario(int id) async {
  final response = await http.delete(
    Uri.parse('https://entrega-nodejs.onrender.com/api/usuarios/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Error al eliminar el usuario: ${response.statusCode}');
  }
}


