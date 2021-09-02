import 'package:flutter/material.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/product_detail_model.dart';

class ProductDetailsController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  final TextEditingController emailController = TextEditingController();
  
  final GlobalKey prefixKey = GlobalKey();
  final double prefixWidth = 0;
  ProductDetails productDetails;
  int productID;
  setProductId({int productId}) {
    productID = productId;
  }
  
  void fetchProductDetails() async {
    setState(ViewState.Busy);
    await Future.delayed(const Duration(milliseconds: 50), () async {
      productDetails =
      await _apiProvider.fetchProductDetails(productId: productID);
    });
    
    setState(ViewState.Retrieved);
    update();
  }
  
  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }
  
  @override
  void onClose() {
    super.onClose();
  }
}