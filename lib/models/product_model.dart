// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String name;
  String category;
  String image;
  String brand;
  String details;
  int price;
  ProductModel({
    required this.name,
    required this.category,
    required this.image,
    required this.brand,
    required this.details,
    required this.price,
  });

  ProductModel copyWith({
    String? name,
    String? category,
    String? image,
    String? brand,
    String? details,
    int? price,
  }) {
    return ProductModel(
      name: name ?? this.name,
      category: category ?? this.category,
      image: image ?? this.image,
      brand: brand ?? this.brand,
      details: details ?? this.details,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'image': image,
      'brand': brand,
      'details': details,
      'price': price,
    };
  }

  factory ProductModel.fromMap(map) {
    return ProductModel(
      name: map['name'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      brand: map['brand'] as String,
      details: map['details'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, category: $category, image: $image, brand: $brand, details: $details, price: $price)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.category == category &&
        other.image == image &&
        other.brand == brand &&
        other.details == details &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        image.hashCode ^
        brand.hashCode ^
        details.hashCode ^
        price.hashCode;
  }
}
