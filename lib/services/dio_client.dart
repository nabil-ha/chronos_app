import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String baseUrl = "http://8.213.26.116:8000/";
  static init([String token = "59ed72d4c5fabcadc23673b97ead26d92595c77c"]) {
    dio = Dio(
      BaseOptions(
        sendTimeout: 5 * 1000,
        receiveTimeout: 5 * 1000,
        connectTimeout: 4 * 1000,
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status <= 500;
        },
        receiveDataWhenStatusError: true,
        headers: token != ""
            ? {
                "Authorization": "Token " + token,
              }
            : null,
      ),
    );
  }
}
