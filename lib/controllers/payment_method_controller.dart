import 'dart:convert';

import 'package:get/get.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/models/payment_method_model.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;

class PaymentMethodController extends GetxController {
  RxList<PaymentMethod> paymentMethod = <PaymentMethod>[].obs;
  RxInt paymentMethodId = 0.obs;
  Rx<PaymentMethod> paymentMethodDetail = PaymentMethod().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Perform the check for user data existence here
    await paymentMethods();
  }

  Future<void> paymentMethods() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/payment-methods');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final List<dynamic> jsonData = json['data'];
          paymentMethod.value = jsonData
              .map((dataJson) => PaymentMethod.fromJson(dataJson))
              .toList();
        } else {
          throw Exception('Failed to load learning material');
        }
      } else {
        throw Exception('Failed to get learning material');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void setDetailId(int? id) {
    paymentMethodId.value = id ?? 0;
  }

  Future<void> getDetailPaymentMethod() async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse(
          '${ApiService.apiUrl}/payment-method/${paymentMethodId.value}');
      http.Response response = await http.get(url, headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
          final Map<String, dynamic> jsonData = json['data'];
          paymentMethodDetail.value = PaymentMethod.fromJson(jsonData);
        } else {
          throw Exception('Failed to load payment method detail');
        }
      } else {
        if (authToken != '') {
          throw Exception(json['message']);
        }
      }
    } catch (e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title: FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }
}
