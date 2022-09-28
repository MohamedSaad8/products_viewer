import 'package:dio/dio.dart';

class ApiHelper {
  Dio dio = Dio();

  Future<dynamic> post(
      {required String url, Map<String, dynamic>? body}) async {
    Response response = await dio.post(url, data: body);
    if (response.statusCode == 200 &&
        response.data["result"]["status"] == 200) {
      return response.data;
    }
  }
}
