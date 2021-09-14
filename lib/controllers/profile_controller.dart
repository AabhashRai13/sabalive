import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/profile_model.dart';

class ProfileController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  ProfileModel profileModel;
  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }
  
  void fetchProfile() async {
    setState(ViewState.Busy);
    profileModel = await _apiProvider.fetchProfile();
    setState(ViewState.Retrieved);
    update();
  }
}
