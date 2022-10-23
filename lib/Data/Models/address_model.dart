import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String id;
  final String name;
  final String address;
  final String image;

  const AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      image: json['img'],
    );
  }

  @override
  String toString() {
    return 'AddressModel{id: $id, name: $name, address: $address, image: $image}';
  }

  @override
  List<Object> get props => [id, name, address, image];
}
