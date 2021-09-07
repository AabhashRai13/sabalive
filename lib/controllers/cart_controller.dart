import 'package:sabalive/api/api.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/cart_model.dart';
import 'package:sabalive/base model/base_model.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  Cart cart;
  List _cartList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  fetchCart() async {
    setState(ViewState.Busy);
    cart = await _apiProvider.fetchCart();
    _cartList.assignAll(cart.data.cartproducts);
    setState(ViewState.Retrieved);
  }
}
