import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ostello_task/data/urls.dart';

class HttpService {
  String baseUrl = MyUrls.baseUrl;

  Future<bool> createStudyAbroadOfStudentPost(
      Map<String, dynamic> bodyData) async {
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

  getStudyAbroadQuestions() async {
    final String apiUrl = '$baseUrl/study-abroad/getStudyAbroadQuestions';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${MyUrls.ACCESS_TOKEN}',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<bool> createTestPrepQuestions(Map<String, dynamic> answerData) async {
    final String apiUrl = '$baseUrl/study-abroad/addAnswersOfStudentById';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${MyUrls.ACCESS_TOKEN}',
    };

    final http.Request request = http.Request('POST', Uri.parse(apiUrl));
    request.body = jsonEncode(answerData);
    request.headers.addAll(headers);

    try {
      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Success in creating test prep answers');
        return true;
      } else {
        print('Failure in creating test prep answers');
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
