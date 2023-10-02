import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/grade_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class GradeController extends GetxController {
  RxList<Grade> grades = <Grade>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Perform the check for user data existence here
    await getGrades();
  }

  Future<void> getGrades() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/grades');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          grades.value =
              jsonData.map((dataJson) => Grade.fromJson(dataJson)).toList();
        } else {
          throw Exception('Failed to load grade');
        }
      } else {
        throw Exception('Failed to get grade');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
