import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/add_to_cart_model.dart';
class AddToCartController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  AddToCart addtoCart;
  
  Future<AddToCart> fetchAddToCart() async {
    setState(ViewState.Busy);
    print("Testing");
    addtoCart = await _apiProvider.fetchAddToCart();
    setState(ViewState.Retrieved);
    print(addtoCart);
    
    if(addtoCart.status== null){
      Fluttertoast.showToast(msg: "Add to Cart Failed");
    }else if(addtoCart.status== "success"){
      Fluttertoast.showToast(msg: "${addtoCart.message}");
    }else{
      Fluttertoast.showToast(msg: "${addtoCart.message}");
  
    }
    print(addtoCart.message);
    update();

    return null;
  }
}
