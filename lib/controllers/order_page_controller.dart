import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/order_models.dart';

class OrderPageController extends BaseController {
  List<OrderList> orderList = [];

ApiProvider _apiService = ApiProvider();

  //bool added = false;
  final count = 0.obs;
  var added = List<int>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderList();
  }

  void fetchOrderList() async {
    setState(ViewState.Busy);
    print('chalyo ');
    orderList = await _apiService.getOrderList();
    print(orderList);
    setState(ViewState.Retrieved);
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
