import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/category_detail_Model.dart';

class CategoryDetailController extends BaseController {
  
  ApiProvider _apiProvider = ApiProvider();
  CategoryDetailModel categoryDetailModel;
  List categoryDetail = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategoryDetail();
  }
  
  void fetchCategoryDetail() async {
    setState(ViewState.Busy);
    categoryDetailModel = await _apiProvider.fetchCategoryDetail();
    if(categoryDetailModel!=null){
      categoryDetail.assignAll(categoryDetailModel.data);
    }
    print("not okay");
    print(categoryDetail);
    setState(ViewState.Retrieved);
  }
  
}
