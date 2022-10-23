import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['img'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, image: $image}';
  }

  @override
  List<Object> get props => [id, name, image];
}
