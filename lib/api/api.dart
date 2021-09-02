import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sabalive/constants/global_variables.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:sabalive/models/forget_password_response.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/models/product_wise_details.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/store.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/storage/sharedprefences/shared_preferences_manager.dart';
import 'package:sabalive/utils/interceptor.dart';

class ApiProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'https://dipesh779.pythonanywhere.com/api/';
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  ApiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }

  Future<Token> loginUser(map) async {
    try {
      final response = await _dio.post(
        'customer/login/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: map,
      );

      if (response.statusCode == 200) {
        return Token.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return null;
    }
    return null;
  }

  Future<RegistrationResponse> registerUser(map) async {
    try {
      final response = await _dio.post(
        'customer/register/',
        data: map,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return RegistrationResponse.fromJson(response.data);
    } catch (error) {
      print("Registration error $error");
      return null;
    }
  }

  Future<ForgetPassword> requestPasswordChange(map) async {
    try {
      final response = await _dio.post(
        'customer/request-reset-email/',
        data: map,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );

      return ForgetPassword.fromJson(response.data);
    } catch (error) {
      print("Forgetpassword error $error");
      return null;
    }
  }

  Future<Storess> fetchStores() async {
    try {
      final response = await _dio.get(
        'customer/store/list/',
      );

      return Storess.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }

  Future<StoreWiseProducts> fetchStoreWiseProducts() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/store/detail/$storeId/',
      );

      return StoreWiseProducts.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }

  Future<AboutUs> fetchAboutUsPage() async {
    try {
      print("check");
      final response = await _dio.get('about-us/',
          options: Options(headers: {
            'requirestoken': false,
          }));
      print(response.data);
      print("check");
      return AboutUs.fromJson(response.data);
    } catch (error) {
      print("About us $error");
      return null;
    }
  }

  Future<Productwisedetails> fetchProductwisedetail() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/store/detail/$storeId/',
        options: Options(
          headers: {
            'requirestoken': false,
          },
        ),
      );

      return Productwisedetails.fromJson(response.data);
    } catch (error) {
      print("Fetch Product Wise $error");
      return null;
    }
  }

  Future<ProductDetails> fetchProductDetails({int productId}) async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/store/$storeId/product/detail/$productId/',
      );

      return ProductDetails.fromJson(response.data);
    } catch (error) {
      print("product Details $error");
      return null;
    }
  }
}
