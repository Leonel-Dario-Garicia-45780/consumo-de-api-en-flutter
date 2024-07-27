class Product {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final String categoria;
  final DateTime fechaCreacion;

  const Product({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.categoria,
    required this.fechaCreacion,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
      stock: json['stock'],
      categoria: json['categoria'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
    );
  }
}
