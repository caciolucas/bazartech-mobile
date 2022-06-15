import 'dart:convert';

import 'package:bazartech/models/product_image.dart';
import 'package:bazartech/models/user.dart';

class Product {
  final int id;
  final List<String> tags;
  final User ownerDisplay;
  final List<ProductImage> imagesDisplay;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final double price;
  int status;
  final int owner;
  Product({
    required this.id,
    required this.tags,
    required this.ownerDisplay,
    required this.imagesDisplay,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.owner,
  });

  Product copyWith({
    int? id,
    List<String>? tagsDisplay,
    User? ownerDisplay,
    List<ProductImage>? imagesDisplay,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    double? price,
    int? status,
    int? owner,
    List<int>? tags,
  }) {
    return Product(
      id: id ?? this.id,
      tags: tagsDisplay ?? this.tags,
      ownerDisplay: ownerDisplay ?? this.ownerDisplay,
      imagesDisplay: imagesDisplay ?? this.imagesDisplay,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      status: status ?? this.status,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tags': tags,
      'owner_display': ownerDisplay.toMap(),
      'images_display': imagesDisplay,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'description': description,
      'price': price,
      'status': status,
      'owner': owner,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    List<ProductImage> imagesDisplay = [];
    for (var image in map['images_display']) {
      imagesDisplay.add(ProductImage.fromMap(image));
    }
    return Product(
      id: map['id']?.toInt() ?? 0,
      tags: List<String>.from(map['tags_display']),
      ownerDisplay: User.fromMap(map['owner_display']),
      imagesDisplay: imagesDisplay,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: double.parse(map['price']),
      status: map['status']?.toInt() ?? 0,
      owner: map['owner']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, tags_display: $tags, owner_display: $ownerDisplay, images_display: $imagesDisplay, created_at: $createdAt, updated_at: $updatedAt, name: $name, description: $description, price: $price, status: $status, owner: $owner)';
  }
}
