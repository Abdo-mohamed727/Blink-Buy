import 'package:blinkbuy/core/networking/auth_interceptor.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio(SecureStorageHelper storage) {
    const timeOut = Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();

      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _dio!.interceptors.add(
        AuthInterceptor(storage),
      );

      _dio!.interceptors.add(
        PrettyDioLogger(
          request: false,
          compact: false,
        ),
      );
    }

    return _dio!;
  }
}