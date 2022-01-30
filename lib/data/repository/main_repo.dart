import 'package:dio/dio.dart';
import 'package:kycbscore/data/core/api_client.dart';
import 'package:kycbscore/data/core/api_constants.dart';
import 'package:kycbscore/data/prefs/prefs.dart';

class MainRepo {
  static signupUser(body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await dio.post(
      ApiConstants.baseVersion1URL + ApiConstants.registerURL,
      data: body,
      options: Options(
        sendTimeout: 50000,
        receiveTimeout: 50000,
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    return response.data;
  }

  static getUserToken(body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await dio.post(
      ApiConstants.baseVersion1URL + ApiConstants.authTokenURL,
      data: body,
      options: Options(
        sendTimeout: 50000,
        receiveTimeout: 50000,
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    return response.data;
  }

  static getRefreshToken(body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await dio.post(
      ApiConstants.baseVersion1URL + ApiConstants.authRefreshTokenURL,
      data: body,
      options: Options(
        sendTimeout: 50000,
        receiveTimeout: 50000,
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    return response.data;
  }

  static getCustomerData(body) async {
    final token = await Prefs.getToken();
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await dio.get(
      ApiConstants.baseVersion1URL + ApiConstants.customerGET,
      queryParameters: body,
      options: Options(
        sendTimeout: 50000,
        receiveTimeout: 50000,
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    return response.data;
  }

  static postCustomerData(body) async {
    final token = await Prefs.getToken();
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await dio.post(
      ApiConstants.baseVersion1URL + ApiConstants.ratingPOST,
      data: body,
      options: Options(
        sendTimeout: 50000,
        receiveTimeout: 50000,
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    return response.data;
  }
}