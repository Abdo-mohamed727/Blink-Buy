import 'dart:convert';

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';
import 'package:blinkbuy/features/auth/domain/repo/auth_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  @override
  Future<ResultApi<String>> register(RegisterRequestEntety register) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.signUp);
      var response = await http.post(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return Success(json['message']);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
