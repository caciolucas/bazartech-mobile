import 'dart:convert';

class ProductImage {
  final int? id;
  final String image;
  final String description;
  final int product;
  ProductImage({
    this.id,
    required this.image,
    required this.description,
    required this.product,
  });

  ProductImage copyWith({
    int? id,
    String? image,
    String? description,
    int? product,
  }) {
    return ProductImage(
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'product': product,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map['id']?.toInt(),
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      product: map['product']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImage.fromJson(String source) =>
      ProductImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductImage(id: $id, image: $image, description: $description, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductImage &&
        other.id == id &&
        other.image == image &&
        other.description == description &&
        other.product == product;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        description.hashCode ^
        product.hashCode;
  }
}
