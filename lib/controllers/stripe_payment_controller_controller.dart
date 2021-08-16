import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripePaymentController extends GetxController {
  double costPrice = 10.0;
  bool isLoading = false;
  int amount = 0;
  @override
  void onInit() {
    super.onInit();
    initalizeStripe();
  }

  void initalizeStripe() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51JObopCmvktvgY1t2MTKNqMs5lwgUQrM07m5ZEidUXB8OxWZXVXcl0SePa1QPd1whTUIVDgbGgfpJIiLKO1JL2FY00JFVRHkPf'));
  }

  Future<void> startPayment() async {
    StripePayment.setStripeAccount(null);
    amount = (10 * 100).toInt();

    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod =
        await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
            .then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print(e);
    });
    startDirectCharege(paymentMethod);
  }

  Future<void> startDirectCharege(PaymentMethod paymentMethod) async {
    print('Payment charge started');

    final http.Response response = await http.post(Uri.parse(""));
    if (response.body != null) {
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent['paymentIntent']['status'];
      final acct = paymentIntent['stripeAccount'];
      if (status == 'succeded') {
        print('Payment done');
      } else {
        StripePayment.setStripeAccount(acct);
        await StripePayment.confirmPaymentIntent(PaymentIntent(
                clientSecret: paymentIntent['paymentIntetn']['payment_method'],
                paymentMethodId: paymentIntent['paymentIntent']
                    ['payment_method']))
            .then((PaymentIntentResult paymentIntentResult) async {
          final paymentStatus = paymentIntentResult.status;
          if (paymentStatus == 'succeded') {
            print('payment done');
          }
        });
      }
    }
  }

/////////// flutter stripe package

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
