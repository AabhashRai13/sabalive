import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sabalive/injector/injector.dart';
import 'package:sabalive/models/Store_wise_product_details.dart';
import 'package:sabalive/models/about_us_model.dart';
import 'package:sabalive/models/add_to_cart_model.dart';
import 'package:sabalive/models/blog_model.dart';
import 'package:sabalive/models/cart_model.dart';
import 'package:sabalive/models/category_detail_Model.dart';
import 'package:sabalive/models/category_list_model.dart';
import 'package:sabalive/models/contact_us_model.dart';
import 'package:sabalive/models/forget_password_response.dart';
import 'package:sabalive/models/order_models.dart';
import 'package:sabalive/models/payment_list_model.dart';
import 'package:sabalive/models/product_detail_model.dart';
import 'package:sabalive/models/product_wise_details.dart';
import 'package:sabalive/models/profile_model.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/slidet_product_model.dart';
import 'package:sabalive/models/store.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/models/update_profile_response.dart';
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

  checkLogin(){
     if(_sharedPreferencesManager.getBool("accessToken") != null){
       return Options(
          headers: {
            'Content-Type': 'application/json',
          },
        );
     }else{Options(
          
        );}
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

  Future<ForgetPassword> requestPasswordforget(map) async {
    try {
      final response = await _dio.post(
        'customer/request-reset-email/',
        data: map,
      );

      return ForgetPassword.fromJson(response.data);
    } catch (error) {
      print("Forgetpassword error $error");
      return null;
    }
  }

  Future requestPasswordChange(map) async {
    try {
      final response = await _dio.patch(
        'customer/change/password/',
        data: map,
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 200) return true;
    } catch (error) {
      print("Forgetpassword error $error");
      return false;
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
        options: _sharedPreferencesManager.getBool("isLogin") == null
            ? Options()
            : Options(
                headers: {
                  'requirestoken': true,
                },
              ),
      );

      return StoreWiseProducts.fromJson(response.data);
    } catch (error) {
      print("Store wise product api error $error");
      return null;
    }
  }

  Future<AboutUs> fetchAboutUsPage() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'store-$storeId/about-us/',
      );
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

  Future<AddToCart> addToCarts(int productId, Map productMap) async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.post(
        'customer/store-$storeId//product-$productId//add-to-cart/',
        data: productMap,
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
        'customer/remove/cart-product-$id/',
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

  Future<BlogModel> fetchBlog() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
        print("Store id $storeId");
    try {
      final response = await _dio.get(
        "store-$storeId/blogs",
      );
      return BlogModel.fromJson(response.data);
    } catch (error) {
      print("Blog api error $error");
      return null;
    }
  }

  Future<ProfileModel> fetchProfile() async {
    try {
      final response = await _dio.get(
        'customer/profile/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      print("store api error $error");
      return null;
    }
  }

  Future<CategoryList> fetchCategoryList() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/store-$storeId/product/category/list/',
        options: _sharedPreferencesManager.getBool("isLogin") == null
            ? Options()
            : Options(
                headers: {
                  'requirestoken': true,
                },
              ),
      );

      return CategoryList.fromJson(response.data);
    } catch (error) {
      print("category api error $error");
      return null;
    }
  }

  Future<CategoryDetailModel> fetchCategoryDetail() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    int categoryId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.categoryId);
    try {
      final response = await _dio.get(
        'customer/store-$storeId/product/category-$categoryId/detail/',
      );

      return CategoryDetailModel.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }

  Future<SliderProductModel> fetchSliderProductList() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response = await _dio.get(
        'customer/homepage/store-$storeId/slider/list/',
        options: _sharedPreferencesManager.getBool("isLogin") == null
            ? Options()
            : Options(
                headers: {
                  'requirestoken': true,
                },
              ),
      );
      return SliderProductModel.fromJson(response.data);
    } catch (error) {
      print("slider api error $error");
      return null;
    }
  }

  Future<OrderList> getOrderList() async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      print('get order');
      final response = await _dio.get(
        'customer/store-$storeId/order/list/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return OrderList.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Order API Error');
      print(error);
    }
    return null;
  }

  checkoutProducts(map, cartId) async {
    int storeId =
        _sharedPreferencesManager.getInt(SharedPreferencesManager.keyStoreId);
    try {
      final response =
          await _dio.post('customer/store-$storeId/order/create/$cartId/',
              data: map,
              options: Options(
                headers: {'requirestoken': true},
              ));
      print("response status ${response.statusCode}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      print(error);
      return false;
    }
    return null;
  }

  Future<UpdateProfileResponse> updateUserProfile(map) async {
    try {
      final response = await _dio.patch(
        'customer/update/',
        data: map,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      return UpdateProfileResponse.fromJson(response.data);
    } catch (error) {
      print("Registration error $error");
      return null;
    }
  }

  Future<PaymentListModel> fetchPaymentList() async {
    try {
      final response = await _dio.get('payment-method/list/',
          options: Options(headers: {
            'requiresToken': true,
          }));

      return PaymentListModel.fromJson(response.data);
    } catch (error) {
      print("Store api error $error");
      return null;
    }
  }
}
