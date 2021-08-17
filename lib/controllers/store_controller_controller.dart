import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/constants/global_variables.dart';
import 'package:sabalive/models/store.dart';

class StoreController extends BaseController {
  final List<String> storenames =
      ["Udaypur Masu Pasal", "Suman meat shop", "Dharan Pork shop"].obs;

  var storeid = "".obs;
  List dataSource = [
    {
      "display": "Udaypur Masu Pasal",
      "value": "Udaypur Masu Pasal",
    },
    {
      "display": "Suman meat shop",
      "value": "Suman meat shop",
    },
    {
      "display": "Dharan Pork shop",
      "value": "Dharan Pork shop",
    },
  ].obs;
  ApiProvider _apiProvider = ApiProvider();
  Store store;
  List stores = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchStores();
  }

  void fetchStores() async {
    setState(ViewState.Busy);
    store = await _apiProvider.fetchStores();
    stores.assignAll(store.data);
    setState(ViewState.Retrieved);
  }

  void assignStoreId({int storeId}) {
    GlobalVariables.storeId = storeId;
  }
}
