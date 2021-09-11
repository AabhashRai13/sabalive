import 'package:get/get.dart';
import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/blog_model.dart';

class BlogController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  BlogModel blogModel;
  List blogs = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchBlogs();
  }
  
  void fetchBlogs() async {
    setState(ViewState.Busy);
    blogModel = await _apiProvider.fetchBlog();
    if(blogModel!=null){
      blogs.assignAll(blogModel.data);
    }
    setState(ViewState.Retrieved);
  }
}
