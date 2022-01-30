import 'package:dio/dio.dart';
import 'package:kycbscore/data/prefs/prefs.dart';

import 'api_constants.dart';
import 'api_client.dart';

class DioClient implements ApiClient {
  late Dio dio;

  DioClient() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseVersion1URL,
    );
  }

  Future<Options> getOptions() async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var token = await Prefs.getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return Options(
      sendTimeout: 50000,
      receiveTimeout: 50000,
      headers: headers,
      responseType: ResponseType.json,
    );
  }

  @override
  Future get(String path, {query}) async {
    var response = await dio.get(
      path,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future post(String path, body, {query}) async {
    var response = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }
}