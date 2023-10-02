import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/schedule_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class ScheduleController extends GetxController {
  RxList<Schedule> list = <Schedule>[].obs;
  Rx<Schedule> detail = Schedule().obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingDetail = false.obs;

  Future<void> getSchedules(Map<String, String>? params) async {
    try {
      list.value = [];
      isLoading.value = true;
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/user/schedules');
      http.Response response = await http.get(
          url.replace(queryParameters: {
            // "grade": params?['grade'],
            "learning_method": params?['learning_method'],
            // "search": params?['search'],
          }),
          headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          list.value =
              jsonData.map((dataJson) => Schedule.fromJson(dataJson)).toList();
          isLoading.value = false;
        } else {
          throw Exception('Failed to load schedule');
        }
      } else {
        throw Exception('Failed to get schedule');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> getDetailSchedule(Schedule data) async {
    detail.value = data;
  }
}
