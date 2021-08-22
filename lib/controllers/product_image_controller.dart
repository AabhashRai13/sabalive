
import 'package:get/get.dart';

class ProductImageController extends GetxController{
  var _currentIndex = 0.obs;
  
  get currentIndex => _currentIndex.value;
  
  set currentIndex(index) => _currentIndex.value =index;
}