import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ostello_task/data/urls.dart';

class HttpService {
  String baseUrl = MyUrls.baseUrl;

  Future<bool> createStudyAbroadOfStudentPost(Map<String, dynamic> bodyData) async {
    final String apiUrl = '$baseUrl/study-abroad/createStudyAbroadOfStudent';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${MyUrls.ACCESS_TOKEN}',
    };

    final http.Request request = http.Request('POST', Uri.parse(apiUrl));
    request.body = jsonEncode(bodyData);
    request.headers.addAll(headers);

    try {
      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Success');
        return true;
      } else {
        print('failure');
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
