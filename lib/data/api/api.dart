import 'package:dio/dio.dart';

class Api {
  Dio dio;

  Api._privateConstructor() {
    final options = BaseOptions(
      baseUrl: 'http://35.246.234.109:8080',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    dio = Dio(options);
  }

  static final Api _instance = Api._privateConstructor();

  static Api get instance {
    return _instance;
  }
}
