import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/store.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';

class StoreController extends BaseController {
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  final List<String> storenames =
      ["Udaypur Masu Pasal", "Suman meat shop", "Dharan Pork shop"].obs;

  var storeName = "".obs;
  List dataSource = [].obs;
  ApiProvider _apiProvider = ApiProvider();
  Storess store;
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
    mapStores(stores);

    setState(ViewState.Retrieved);
  }

  mapStores(List storeList) {
    for (int i = 0; i < storeList.length; i++) {
      Map map =
          {"id": storeList[i].id, "store_name": storeList[i].storeName}.obs;
      dataSource.add(map);
    }
  }

  setStoreName({int storeId}) {
    for (int i = 0; i < stores.length; i++) {
      if (stores[i].id == storeId) {
        storeName.value = stores[i].storeName;
      }
    }
  }

  void assignStoreId({int storeId}) async {
    await sharedPreferencesManager.putInt(
        SharedPreferencesManager.keyStoreId, storeId);
  }
}
