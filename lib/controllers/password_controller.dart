import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/utils/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_text_field.dart';

class PasswordController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  OtpFieldController otpC = OtpFieldController();
  TextEditingController otpInput = TextEditingController();
  TextEditingController newPasswordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  @override
  void onClose() {
    emailInput.dispose();
    otpInput.dispose();
    newPasswordInput.dispose();
    confirmPasswordInput.dispose();
    super.dispose();
  }

  Future<void> forgotPassword(Map<String, dynamic> body) async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/forgot-password/send-email');

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
       } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title:FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }

  Future<void> verifyOTP(Map<String, dynamic> body) async {
    try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/forgot-password/verify-otp');

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
       } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      Get.back();
      FlashController()
          .flashMessage(FlashMessageType.error, title:FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }

  Future<void> resetPassword(Map<String, dynamic> body) async {
     try {
      final String authToken = await ApiService().getToken();
      var headers = ApiService().getHeaders();
      headers['Authorization'] = "Bearer $authToken";
      var url = Uri.parse('${ApiService.apiUrl}/reset-password');

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json['code'] == 200) {
       } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (e) {
      Get.back();
      FlashController()
          .flashMessage(FlashMessageType.error, title:FlashController().setProperError(e.toString()));
      throw Exception(e);
    }
  }
}
