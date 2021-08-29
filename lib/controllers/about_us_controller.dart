import 'package:sabalive/api/api.dart';
import 'package:sabalive/base%20model/base_model.dart';
import 'package:sabalive/constants/enum.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:sabalive/models/product_wise_details.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutUsController extends BaseController {
  ApiProvider _apiProvider = ApiProvider();
  AboutUs aboutUs;
  Productwisedetails productwisedetails;
  @override
  void onInit() {
    super.onInit();
    fetchAboutUs();
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  
  Future<AboutUs> fetchAboutUs() async {
    setState(ViewState.Busy);
    print("Testing");
    aboutUs = await _apiProvider.fetchAboutUsPage();
    print(aboutUs.data);
    setState(ViewState.Retrieved);
    return aboutUs;
  }
  
  Future<Productwisedetails> fetchProductwiseDetails() async{
    setState(ViewState.Busy);
    print("Testing");
    productwisedetails = await _apiProvider.fetchProductwisedetail();
    print(aboutUs.data);
    setState(ViewState.Retrieved);
    return productwisedetails;
  }
}
