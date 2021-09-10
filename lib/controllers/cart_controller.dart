import 'package:sabalive/api/api.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/cart_model.dart';
import 'package:sabalive/base model/base_model.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  Cart cart;
  List cartList = <Cartproduct>[].obs;

  var count = <int>[].obs;
  var priceTotalList = <int>[].obs;
  List quantityTotalList = <int>[].obs;
  var priceTotal = 0.obs;
  bool isOrderPlaced = false;
  bool isDeleted = false;
  var a = 2.obs;

  populatePriceTotalList() {
    for (var i = 0; i < cartList.length; i++) {
      priceTotalList
          .add(double.parse(cartList[i].product.sellingPrice).round());
      print("length of price List   ${priceTotalList.length}");
    }
  }

  populateQuantityTotalList() {
    for (var i = 0; i < cartList.length; i++) {
      quantityTotalList.add(cartList[i].quantity);
      print("length of quantity List ${quantityTotalList.length}");
    }
  }

  priceCharge() {
    for (var i = 0; i < priceTotalList.length; i++) {
      priceTotal = priceTotal + (priceTotalList[i] * quantityTotalList[i]);
      print("Price total $priceTotal");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void deleteCartList(int id, int index) async {
    isDeleted = await _apiProvider.deleteCartItem(id, cart.data.id);
    if (isDeleted) {
      priceChargeAfterDelete(index);
    }
  }

  priceChargeAfterDelete(int index) {
    priceTotal = priceTotal - priceTotalList[index];
  }

  // Future placeOrder(Map shippingAddressPk) async {
  //   setState(ViewState.Busy);
  //   isOrderPlaced = await apiAuthProvider.placeOrder(shippingAddressPk);
  //   if (isOrderPlaced) {
  //     print(isOrderPlaced);
  //     Get.back();
  //     Get.snackbar(
  //         "Order placed successfully", "Check order page to see your orders");
  //   }
  //   setState(ViewState.Retrieved);
  // }

  @override
  void onClose() {}

  void increment(int index) {
    count[index] = count[index] + 1;
    print("adding count ${count[index]}");
  }

  void decrement(int index) => count[index] = count[index] - 1;

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  fetchCart() async {
    setState(ViewState.Busy);
    cart = await _apiProvider.fetchCart();
    if (cart != null) {
      cartList.assignAll(cart.data.cartproducts);
      populatePriceTotalList();
      populateQuantityTotalList();
      priceCharge();
    }
    setState(ViewState.Retrieved);
  }
}
