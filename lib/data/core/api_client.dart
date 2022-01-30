import 'package:dio/dio.dart';

import 'dio_client.dart';

class ApiClient {
  Future get(String path, {query}) async {}
  Future post(String path, body, {query}) async {}
}

final apiClient = DioClient();
var dio = Dio();