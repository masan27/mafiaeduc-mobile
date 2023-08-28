import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashController extends GetxController {
  void flashMessage(String type, {String? title, String? message}) {
    Color bg = Colors.green;
    if (type == 'success') {
      bg = Colors.green;
    } else if (type == 'error') {
      bg = Colors.red;
    } else if (type == 'warning') {
      bg = Colors.yellow;
    } else if (type == 'info') {
      bg = Colors.indigo;
    } else {
      bg = Colors.grey;
    }
    // bool checkMessage = showMessage ?? true;
    String messageBody;
    if (title != null) {
      messageBody = message ?? "";
    } else {
      messageBody = "";
    }
    Get.snackbar(
      title ?? message ?? "Terjadi kesalahan",
      messageBody,
      colorText: Colors.white,
      backgroundColor: bg,
      snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.grey,
      borderRadius: 10,
      borderWidth: 2,
      barBlur: 0,
    );
  }
}
