import 'package:get/get.dart';
import 'package:sabalive/models/product_detail_model.dart';

class WishlistController extends GetxController{
  List _productWishList=[].obs;
  
  List get productList => _productWishList;
  
  void addProduct(ProductDetails product){
    _productWishList.indexWhere((item) => item==product);
    _productWishList.add(product);
  }
  
  void removeProduct(ProductDetails product){
    _productWishList.indexWhere((item) => item==product);
  _productWishList.remove(product);
  }
}