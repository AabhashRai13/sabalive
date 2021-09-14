import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/add_to_cart_model.dart';

class AddToCartController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  AddToCart addtoCart;


void mapProduct({int productID, int productQuantiity, List productChoices}){
 Map productMap = {
    "quantity" : productQuantiity,
    "choices" : productChoices
};
addToCart(productID: productID, productMap:productMap);
}

  Future<AddToCart> addToCart({int productID, Map productMap}) async {
    setState(ViewState.Busy);
    addtoCart = await _apiProvider.addToCarts(productID, productMap);
    setState(ViewState.Retrieved);
    print(addtoCart);

    if (addtoCart == null) {
      Fluttertoast.showToast(
          msg: "Add to Cart Failed", gravity: ToastGravity.CENTER);
    } else if (addtoCart.status == "success") {
      Fluttertoast.showToast(
          msg: "${addtoCart.message}", gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(
          msg: "${addtoCart.message}", gravity: ToastGravity.CENTER);
    }
    print(addtoCart.message);
    update();

    return null;
  }
}
