import 'package:get/get.dart';
import 'package:sabalive/constants/enum.dart';

class BaseController extends GetxController {
  var _state = ViewState.Idle.obs;

  ViewState get state => _state.value;

  void setState(ViewState newState) {
    _state.value = newState;
  }
}
