import 'dart:convert';

class Product {
  final String name;
  final String description;
  final String category;
  final double price;
  final double quantity;
  final List<String> images;
  final String? id;

  Product(this.id,
      {required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.quantity,
      required this.images});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'images': images,
      'category': category
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? 0.0,
      quantity: map['quantity'] ?? 0.0,
      images: List<String>.from(map['images']),
    );
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
