import 'package:dio/dio.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';

class AuthInterceptor extends Interceptor {

  final SecureStorageHelper storage;

  AuthInterceptor(this.storage);


  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {

    final token = await storage.getSecure(
      key: 'token',
    );


    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] =
          'Bearer $token';
    }


    handler.next(options);
  }
}