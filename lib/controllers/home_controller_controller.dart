import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/models/category_list_model.dart';
import 'package:sabalive/models/slidet_product_model.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class HomeController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  StoreWiseProducts storeWiseProducts;
  List products = [].obs;

  CategoryList categoryList;
  List categoryLists=[].obs;
  
  
  SliderProductModel sliderProductModel;
  List sliderLists=[].obs;
   

  final SharedPreferencesManager sharedPreferencesManager =
  locator<SharedPreferencesManager>();
  @override
  void onInit() {
    super.onInit();
    fetchStoreWiseProducts();
    fetchCategoryList();
    fetchSliderProductList();
  }

  void fetchStoreWiseProducts() async {
    setState(ViewState.Busy);
    storeWiseProducts = await _apiProvider.fetchStoreWiseProducts();
    products.assignAll(storeWiseProducts.data.products);
    setState(ViewState.Retrieved);
  }

  void fetchCategoryList() async {
    setState(ViewState.Busy);
    categoryList = await _apiProvider.fetchCategoryList();
    categoryLists.assignAll(categoryList.data);
    setState(ViewState.Retrieved);
  }

  void fetchSliderProductList() async {
    setState(ViewState.Busy);
    sliderProductModel = await _apiProvider.fetchSliderProductList();
    sliderLists.assignAll(sliderProductModel.data);
    setState(ViewState.Retrieved);
  }
  
  void assignCategoryId({int categoryId}) async{
    await sharedPreferencesManager.putInt(
        SharedPreferencesManager.categoryId, categoryId);  }
}
