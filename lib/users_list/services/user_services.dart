import 'dart:io';

import 'package:flutter_application_2/users_list/models/users_list_model.dart';
import 'package:flutter_application_2/users_list/services/api_status.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USER_LIST));
      if (SUCCES == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
