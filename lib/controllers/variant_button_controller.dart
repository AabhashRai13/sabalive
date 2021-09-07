import 'package:get/get.dart';

class VariantButtonController extends GetxController{

List<String> variant= ["100 gm","200 gm","500 gm","1000 gm",];
var selectedVariant="".obs;
final List<String> gender = ["Male", "Female"];

String select;
void onClickRadioButton(value) {
  print(value);
  select = value;
  update();
}
}