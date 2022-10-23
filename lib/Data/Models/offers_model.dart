import 'package:equatable/equatable.dart';

class OffersModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String priceBeforeDeal;
  final String priceAfterDeal;
  final String availableUntil;

  const OffersModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priceBeforeDeal,
    required this.priceAfterDeal,
    required this.availableUntil,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      priceBeforeDeal: json['price_before_offer'],
      priceAfterDeal: json['price_after_offer'],
      availableUntil: json['available_until'],
    );
  }

  @override
  String toString() {
    return 'OffersModel{id: $id, title: $title, description: $description, priceBeforeDeal: $priceBeforeDeal, priceAfterDeal: $priceAfterDeal, availableUntil: $availableUntil}';
  }

  @override
  List<Object> get props =>
      [
        id,
        title,
        description,
        priceBeforeDeal,
        priceAfterDeal,
        availableUntil,
      ];
}
