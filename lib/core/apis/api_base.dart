import 'package:dio/dio.dart';

class ApiBase {
  static Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? params,
  }) {
    var res = Dio().get(path, queryParameters: params);
    return res;
  }
}
