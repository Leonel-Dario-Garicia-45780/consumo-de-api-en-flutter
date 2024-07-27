import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consumo_de_api/models/product.dart';

Future<List<Product>> consultarProductos() async {
  final response = await http.get(Uri.parse('https://entrega-nodejs.onrender.com/api/productos'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar los productos');
  }
}
