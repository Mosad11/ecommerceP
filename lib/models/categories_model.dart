// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String name;
  String image;
  CategoryModel({
    required this.name,
    required this.image,
  });

  CategoryModel copyWith({
    String? name,
    String? image,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(map) {
    return CategoryModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'categoryModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
