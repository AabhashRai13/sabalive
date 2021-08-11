import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sabalive/models/registration_model.dart';
import 'package:sabalive/models/token.dart';
import 'package:sabalive/utils/interceptor.dart';

class ApiProvider {
  final Dio _dio = new Dio();
  final String _baseUrl = 'https://sabalive.pythonanywhere.com/api/';

  ApiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
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

  Future<RegistrationResponse> registerUser(Map map) async {
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
}