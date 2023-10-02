import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/models/contact_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  RxList<Contact> list = <Contact>[].obs;
  Rx<Contact> detail = Contact().obs;

  Future<void> getContacts() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/contacts');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          list.value =
              jsonData.map((dataJson) => Contact.fromJson(dataJson)).toList();
        } else {
          throw Exception('Failed to load contact');
        }
      } else {
        throw Exception('Failed to get contact');
      }
    } catch (e) {
      // print(FlashController().setProperError(e.toString()););
      throw Exception(e);
    }
  }
}
