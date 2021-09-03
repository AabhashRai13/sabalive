import 'package:get/get.dart';

class CounterController extends GetxController {
  var _count = 0.obs;
  
  int get count => _count.value;
  
  void increment() {
    _count++;
  }
  
  void decrement() {
    _count--;
  }
  
  void reset() {
    _count.value = 0;
  }
}