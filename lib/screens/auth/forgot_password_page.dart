import 'package:flutter/material.dart';
import 'package:sabalive/controllers/controllers/forgot_password_controller_controller.dart';

import '../../app_properties.dart';

class ForgotPasswordPage extends StatelessWidget {
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Forgot your Password?',
      style: TextStyle(
          color: Colors.teal[600],
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Enter your registered email to get the Reset Password mail',
          style: TextStyle(
            color: Colors.teal[600],
            fontSize: 16.0,
          ),
        ));

    Widget sendButton = Positioned(
      bottom: 40,
      child: InkWell(
        onTap: () {
          _forgotPasswordController.enterEmail();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Send Mail",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              color: Colors.teal[600],
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget emailForm = Container(
      height: 210,
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0, bottom: 30),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: _forgotPasswordController.emailController,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sendButton,
        ],
      ),
    );

    Widget resendAgainText = Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Didn't receive the OPT? ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.teal[600],
                fontSize: 14.0,
              ),
            ),
            InkWell(
              onTap: () {
                _forgotPasswordController.enterEmail();
              },
              child: Text(
                'Resend again',
                style: TextStyle(
                  color: Colors.teal[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ));
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: lightgreen),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: 3),
                      title,
                      Spacer(),
                      subTitle,
                      Spacer(flex: 2),
                      emailForm,
                      Spacer(flex: 2),
                      resendAgainText
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
