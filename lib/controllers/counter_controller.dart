import 'package:get/get.dart';
import 'package:sabalive/models/product_detail_model.dart';

class CounterController extends GetxController {
  var _count = 1.obs;
 bool isExpanded = false;
 int firstTime = 0;
  int get count => _count.value;
 List optionId = [];
updateInitOptionId(List<Productrequestoption> productRequestoptions){
  optionId.clear();
 for (int i = 0; i < productRequestoptions.length; i++){
   optionId.add( productRequestoptions[i].productrequestoptionchoices[0].id);
  
 }
 print("Option id $optionId");
}
 

 void updateOptionId(int index, int id){
     
   optionId[index] = id;
     print("Option id $optionId");
      update();


  }
@override
  void onClose() {
    optionId.clear();
    super.onClose();
  }
void expandWidget(){
  firstTime++;
  isExpanded =
     ! isExpanded;
     update();
}

  void increment() {
    _count++;
  }

  void decrement() {
    if (_count > 1) _count--;
  }

  void reset() {
    _count.value = 0;
  }
}
