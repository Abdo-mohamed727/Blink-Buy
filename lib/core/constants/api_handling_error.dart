import 'package:dio/dio.dart';


abstract class ApiHandlingError {


 static String handleDioError(DioException error) {
    switch (error.type) {

      case DioExceptionType.connectionTimeout:
        return "Connection timeout";

      case DioExceptionType.sendTimeout:
        return "Send timeout";

      case DioExceptionType.receiveTimeout:
        return "Receive timeout";

      case DioExceptionType.badResponse:
        return error.response?.data['message'] ??
            "Something went wrong";

      case DioExceptionType.cancel:
        return "Request cancelled";

      case DioExceptionType.connectionError:
        return "No internet connection";

      default:
        return "Unexpected error";
    }
  }
}