import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';

class HomeController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  StoreWiseProducts storeWiseProducts;
  List products = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchStoreWiseProducts();
  }

  void fetchStoreWiseProducts() async {
    setState(ViewState.Busy);
    storeWiseProducts = await _apiProvider.fetchStoreWiseProducts();
    products.assignAll(storeWiseProducts.data.products);
    setState(ViewState.Retrieved);
  }
  
}
