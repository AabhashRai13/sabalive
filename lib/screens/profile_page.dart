import 'package:flutter/material.dart';
import 'package:sabalive/controllers/profile_controller.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/screens/settings/settings_page.dart';
import 'package:sabalive/screens/tracking_page.dart';
import 'package:sabalive/screens/wallet/wallet_page.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';
import 'package:get/get.dart';
import '../app_properties.dart';
import 'faq_page.dart';

class ProfilePage extends StatelessWidget {
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                sharedPreferencesManager.getString("accessToken")==null
                    ?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      minRadius: 50.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("User not Login"),
                  ],
                ):GetBuilder<ProfileController>(
                  init: ProfileController(),
                  builder: (value) => value.profileModel == null
                      ? Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 48,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 48,
                                backgroundImage:
                                    NetworkImage(value.profileModel.message.image),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.profileModel.message.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: lightgreen,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.wallet_giftcard),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => WalletPage())),
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.local_shipping),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => TrackingPage())),
                            ),
                            Text(
                              'Shipped',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.help),
                              onPressed: () {},
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and logout'),
                  leading: Image.asset(
                    'assets/icons/settings_icon.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right, color: darkgreen),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SettingsPage())),
                ),
                Divider(),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Image.asset('assets/icons/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: darkgreen,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/icons/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: darkgreen),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sabalive/constants/enum.dart';
// import 'package:sabalive/controllers/profile_controller.dart';
// import 'package:sabalive/screens/payment/payment_page.dart';
// import 'package:sabalive/screens/settings/settings_page.dart';
// import 'package:sabalive/screens/tracking_page.dart';
// import 'package:sabalive/screens/wallet/wallet_page.dart';
// import 'package:get/get.dart';
// import '../app_properties.dart';
// import 'faq_page.dart';
//
// class ProfilePage extends StatelessWidget {
//
//   final ProfileController profileController=Get.put(ProfileController());
//   Widget _buildLoadingWidget() {
//     return SpinKitCircle(color: Colors.blue[400]);
//   }
//
//   Widget _buildSuccessWidget(BuildContext context){
//     return SafeArea(
//       top: true,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding:
//           EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
//           child: profileController.profileModel.data == null
//               ? Center(
//             child: Text(
//               "No Data Found",
//               style: TextStyle(
//                 fontSize: 22,
//               ),
//             ),
//           )
//               : Column(
//             children: <Widget>[
//               CircleAvatar(
//                 maxRadius: 48,
//                 backgroundImage: NetworkImage(profileController.profileModel.data.image),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   profileController.profileModel.data.name.capitalize,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 16.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(8),
//                         topRight: Radius.circular(8),
//                         bottomLeft: Radius.circular(8),
//                         bottomRight: Radius.circular(8)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: lightgreen,
//                           blurRadius: 4,
//                           spreadRadius: 1,
//                           offset: Offset(0, 1))
//                     ]),
//                 height: 150,
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(Icons.wallet_giftcard),
//                             onPressed: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (_) => WalletPage())),
//                           ),
//                           Text(
//                             'Wallet',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(Icons.local_shipping),
//                             onPressed: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (_) => TrackingPage())),
//                           ),
//                           Text(
//                             'Shipped',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(Icons.payment),
//                             onPressed: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (_) => PaymentPage())),
//                           ),
//                           Text(
//                             'Payment',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(Icons.help),
//                             onPressed: () {},
//                           ),
//                           Text(
//                             'Support',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: Text('Settings'),
//                 subtitle: Text('Privacy and logout'),
//                 leading: Image.asset(
//                   'assets/icons/settings_icon.png',
//                   fit: BoxFit.scaleDown,
//                   width: 30,
//                   height: 30,
//                 ),
//                 trailing: Icon(Icons.chevron_right, color: darkgreen),
//                 onTap: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (_) => SettingsPage())),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text('Help & Support'),
//                 subtitle: Text('Help center and legal support'),
//                 leading: Image.asset('assets/icons/support.png'),
//                 trailing: Icon(
//                   Icons.chevron_right,
//                   color: darkgreen,
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text('FAQ'),
//                 subtitle: Text('Questions and Answer'),
//                 leading: Image.asset('assets/icons/faq.png'),
//                 trailing: Icon(Icons.chevron_right, color: darkgreen),
//                 onTap: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (_) => FaqPage())),
//               ),
//               Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF9F9F9),
//       body: GetBuilder<ProfileController>(
//           builder: (value) => profileController.state == ViewState.Busy
//               ? _buildLoadingWidget()
//               : _buildSuccessWidget(context)),
//     );
//   }
// }
