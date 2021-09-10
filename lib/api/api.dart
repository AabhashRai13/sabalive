import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:sabalive/models/add_to_cart_model.dart';
import 'package:sabalive/models/blog_model.dart';
import 'package:sabalive/models/cart_model.dart';
import 'package:sabalive/models/contact_us_model.dart';
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
      } else
        return null;
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return null;
    }
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
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get('store-$storeId/about-us/',
          options: Options(headers: {
            'requirestoken': false,
          }));
      return AboutUs.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
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
      print("Store api error $error");
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
      print("Store api error $error");
      return null;
    }
  }

  Future<AddToCart> addToCarts(int productId) async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/store-$storeId//product-$productId//add-to-cart/?quantity=2',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return AddToCart.fromJson(response.data);
    } catch (error) {
      print("store api error $error");
      return null;
    }
  }

  Future<bool> deleteCartItem(int id, int cartId) async {
    try {
      final response = await _dio.delete(
        'customer/remove/cart-$cartId/product-$id/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      print("login error $error");
      return false;
    }
    return null;
  }

  Future<ContactUs> contact(map) async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.post(
        'store-$storeId/contact/us/',
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

  Future<Cart> fetchCart() async {
    try {
      final response = await _dio.get(
        "customer/cart-product/list/",
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return Cart.fromJson(response.data);
    } catch (error) {
      print("cart api error $error");
      return null;
    }
  }
  
  Future<BlogModel> fetchBlog() async{
    int storeId =
    _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try{
      final response = await _dio.get(
        "store-4/blogs",
      );
          return BlogModel.fromJson(response.data);
    } catch(error){
      print("Blog api error $error");
      return null;
    }
  }
}
