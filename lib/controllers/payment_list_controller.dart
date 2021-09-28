import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/payment_list_model.dart';

class PaymentListController extends BaseController {
  PaymentListModel paymentListModel;

  ApiProvider _apiService = ApiProvider();

  @override
  void onInit() {
    super.onInit();
    fetPaymentList();
  }

  void fetPaymentList() async {
    setState(ViewState.Busy);
    paymentListModel = await _apiService.fetchPaymentList();
    print(paymentListModel);
    setState(ViewState.Retrieved);
  }

  @override
  void onReady() {
    super.onReady();
    fetPaymentList();
  }

  @override
  void onClose() {}
}
