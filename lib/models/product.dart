import 'dart:convert';

import 'package:bazartech/models/product_image.dart';
import 'package:bazartech/models/user.dart';
import 'package:collection/collection.dart';

class Product {
  final int id;
  final List<String> tagsDisplay;
  final User ownerDisplay;
  final List<ProductImage> imagesDisplay;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final double price;
  final int status;
  final int owner;
  final List<int> tags;
  Product({
    required this.id,
    required this.tagsDisplay,
    required this.ownerDisplay,
    required this.imagesDisplay,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.owner,
    required this.tags,
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
      tagsDisplay: tagsDisplay ?? this.tagsDisplay,
      ownerDisplay: ownerDisplay ?? this.ownerDisplay,
      imagesDisplay: imagesDisplay ?? this.imagesDisplay,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      status: status ?? this.status,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tags_display': tagsDisplay,
      'owner_display': ownerDisplay.toMap(),
      'images_display': imagesDisplay,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'description': description,
      'price': price,
      'status': status,
      'owner': owner,
      'tags': tags,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    List<ProductImage> imagesDisplay = [];
    for (var image in map['images_display']) {
      imagesDisplay.add(ProductImage.fromMap(image));
    }
    return Product(
      id: map['id']?.toInt() ?? 0,
      tagsDisplay: List<String>.from(map['tags_display']),
      ownerDisplay: User.fromMap(map['owner_display']),
      imagesDisplay: imagesDisplay,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: double.parse(map['price']),
      status: map['status']?.toInt() ?? 0,
      owner: map['owner']?.toInt() ?? 0,
      tags: List<int>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, tags_display: $tagsDisplay, owner_display: $ownerDisplay, images_display: $imagesDisplay, created_at: $createdAt, updated_at: $updatedAt, name: $name, description: $description, price: $price, status: $status, owner: $owner, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Product &&
        other.id == id &&
        listEquals(other.tagsDisplay, tagsDisplay) &&
        other.ownerDisplay == ownerDisplay &&
        listEquals(other.imagesDisplay, imagesDisplay) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.status == status &&
        other.owner == owner &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tagsDisplay.hashCode ^
        ownerDisplay.hashCode ^
        imagesDisplay.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        status.hashCode ^
        owner.hashCode ^
        tags.hashCode;
  }
}
