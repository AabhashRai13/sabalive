import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutUsController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  AboutUs aboutUs;
  @override
  void onInit() {
    super.onInit();
    aboutUS();
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  
  Future<AboutUs> aboutUS() async {
    setState(ViewState.Busy);
    aboutUs = await _apiProvider.fetchAboutUsPage();
    print(aboutUs.data);
    print("testing");
    setState(ViewState.Retrieved);
    update();
    return null;
  }
  
 
}
