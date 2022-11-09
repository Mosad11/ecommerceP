// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  int? id;
  String name;
  String image;
  int price;
  int count;
  CartModel({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'count': count,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      count: map['count'] as int,
    );
  }
}
