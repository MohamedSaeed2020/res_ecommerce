import 'package:equatable/equatable.dart';

class DealsOfTheDayModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String location;
  final String image;
  final String priceBeforeDeal;
  final String priceAfterDeal;
  final bool isFavorite;

  const DealsOfTheDayModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.image,
    required this.priceBeforeDeal,
    required this.priceAfterDeal,
    required this.isFavorite,
  });


  factory DealsOfTheDayModel.fromJson(Map<String, dynamic> json) {
    return DealsOfTheDayModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      image: json['img'],
      priceBeforeDeal: json['price_before_deal'],
      priceAfterDeal: json['price_after_deal'],
      isFavorite: json['is_favorite'],
    );
  }

  @override
  String toString() {
    return 'DealsOfTheDayModel{id: $id, name: $name, description: $description, location: $location, image: $image, priceBeforeDeal: $priceBeforeDeal, priceAfterDeal: $priceAfterDeal}';
  }

  @override
  List<Object> get props =>
      [
        id,
        name,
        description,
        location,
        image,
        priceBeforeDeal,
        priceAfterDeal,
        isFavorite,
      ];
}
