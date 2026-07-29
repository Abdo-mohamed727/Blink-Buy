import 'dart:convert';
import 'dart:developer';

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/data/model/register_request_dto.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  @override
  Future<ResultApi<String>> register(RegisterRequestEntity register) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.signUp);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //!!!!!
        // body: jsonEncode(),
      );

      log('StatusCode: ${response.statusCode}');

      var responseBody = response.body;
      log('ResponseBody: ${response.body}');
      var json = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        log('Register Success ${json['message']}');
        return Success(json['message']);
      } else {
        log('Register Error ${json['message']}');
        return Error(json['message']);
      }
    } catch (e) {
      log('Register Error Catch $e');
      return Error(e.toString());
    }
  }
}
