import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sabalive/constants/global_variables.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:sabalive/models/add_to_cart_model.dart';
import 'package:sabalive/models/contact_us_model.dart';
import 'package:sabalive/models/forget_password_response.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/models/product_wise_details.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/store.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/utils/interceptor.dart';

class ApiProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'https://dipesh779.pythonanywhere.com/api/';
  
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
  
  Future<StoreModel> fetchStores() async {
    try {
      final response = await _dio.get(
        'customer/store/list/',
      );
      
      return StoreModel.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }
  
  Future<StoreWiseProducts> fetchStoreWiseProducts() async {
    try {
      final response = await _dio.get(
        'customer/store/detail/1/',
        options: Options(
          headers: {
            'requirestoken': false,
          },
        ),
      );
      
      return StoreWiseProducts.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }
  
  Future<AboutUs> fetchAboutUsPage() async {
    try {
      final response = await _dio.get(
          'store-2/about-us/',
          options: Options(
              headers: {
                'requirestoken': false,
              }
          )
      );
      print(response.data);
      print("check");
      return AboutUs.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }
  
  Future<Productwisedetails> fetchProductwisedetail() async {
    try {
      final response = await _dio.get(
        'customer/store/detail/${GlobalVariables.productId}/',
        options: Options(
          headers: {
            'requirestoken': false,
          },
        ),
      );
      return Productwisedetails.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }

  Future<ProductDetails> fetchProductDetails({int productId}) async {
    try {
      final response = await _dio.get(
        'customer/store/1/product/detail/$productId/',
        options: Options(
          headers: {
            'requirestoken': false,
          },
        ),
      );
    
      return ProductDetails.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }
  
  Future<AddToCart> addToCarts() async{
    try{
      final response = await _dio.get(
        'customer/store-${GlobalVariables.storeId}//product-${GlobalVariables.productId}//add-to-cart/?quantity=2',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return AddToCart.fromJson(response.data);
    }catch(error){
      print("store api error $error");
      return null;
    }
  }
  
  
  Future<ContactUs> contact(map) async {
    try {
      final response = await _dio.post(
        'store-${GlobalVariables.storeId}/contact/us/',
        data: map,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return ContactUs.fromJson(response.data);
    } catch (error) {
      print("Registration error $error");
      return null;
    }
  }
  
}



