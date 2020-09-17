import 'package:dio/dio.dart';


class Api {
  Dio dio;
  Api._privateConstructor() {
    // TODO: Put real URL
    final options = BaseOptions(
      baseUrl: 'https://dumka.com.ua/api',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    dio = Dio(options);
  }

  static final Api _instance = Api._privateConstructor();

  static Api get instance { return _instance; }
}