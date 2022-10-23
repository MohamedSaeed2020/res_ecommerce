import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/assets_paths.dart';
import 'package:res_ecommerce/Data/Models/address_model.dart';
import 'package:res_ecommerce/Data/Models/category_model.dart';
import 'package:res_ecommerce/Data/Models/deals_of_the_day_model.dart';
import 'package:res_ecommerce/Data/Models/offers_model.dart';

class GroceryController extends GetxController {
   List<AddressModel> _addressesList=[];
   List<CategoryModel> _categoriesList=[];
   List<DealsOfTheDayModel> _dealsOfTheDayList=[];
   OffersModel? _offersModel;

  List<AddressModel> get addressesList => _addressesList;

  List<CategoryModel> get categoriesList => _categoriesList;

  List<DealsOfTheDayModel> get dealsOfTheDayList => _dealsOfTheDayList;

  OffersModel? get offersModel => _offersModel;

  @override
  Future<void> onInit() async {
    _addressesList = await loadAddressesMockData(AssetsManager.addressesJson);
    _categoriesList =
        await loadCategoriesMockData(AssetsManager.categoriesJson);
    _dealsOfTheDayList =
        await loadDealsOfTheDayMockData(AssetsManager.dealsJson);
    _offersModel = await loadOffersMockData(AssetsManager.offersJson);
   update();
    super.onInit();
  }

  Future<List<AddressModel>> loadAddressesMockData(String source) async {
    final response = await rootBundle.loadString(source);
    final data = jsonDecode(response) as List;
    return data.map((address) => AddressModel.fromJson(address)).toList();
  }

  Future<List<CategoryModel>> loadCategoriesMockData(String source) async {
    final response = await rootBundle.loadString(source);
    final data = jsonDecode(response) as List;
    return data.map((category) => CategoryModel.fromJson(category)).toList();
  }

  Future<List<DealsOfTheDayModel>> loadDealsOfTheDayMockData(
      String source) async {
    final response = await rootBundle.loadString(source);
    final data = jsonDecode(response) as List;
    return data.map((deal) => DealsOfTheDayModel.fromJson(deal)).toList();
  }

  Future<OffersModel> loadOffersMockData(String source) async {
    final response = await rootBundle.loadString(source);
    final data = jsonDecode(response);
    return OffersModel.fromJson(data);
  }
}
