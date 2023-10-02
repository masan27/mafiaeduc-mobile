import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/subject_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class SubjectController extends GetxController {
  RxList<Subject> subjects = <Subject>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Perform the check for user data existence here
    await getSubjects();
  }

  Future<void> getSubjects() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/subjects');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          subjects.value =
              jsonData.map((dataJson) => Subject.fromJson(dataJson)).toList();
        } else {
          throw Exception('Failed to load subject');
        }
      } else {
        throw Exception('Failed to get subject');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
