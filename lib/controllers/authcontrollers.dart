// // auth_controller.dart
// import 'package:get/get.dart';
// import 'package:mafiaeducation/controllers/apiservice.dart';

// class AuthController extends GetxController {
//   final ApiService _apiService = ApiService();

//   // Variabel state untuk mengecek status login
//   var isLoggedIn = false.obs;

//   void register(String name, String email, String password) async {
//     Map<String, dynamic> response =
//         await _apiService.register(name, email, password);
//     if (response['status'] == 'success') {
//       // Jika berhasil register, ubah status login
//       isLoggedIn.value = true;
//       Get.snackbar('Registrasi Berhasil', response['message']);
//     } else {
//       Get.snackbar('Registrasi Gagal', response['message']);
//     }
//   }

//   void login(String email, String password) async {
//     Map<String, dynamic> response = await _apiService.login(email, password);
//     if (response['status'] == 'success') {
//       // Jika berhasil login, ubah status login
//       isLoggedIn.value = true;
//       Get.snackbar('Login Berhasil', response['message']);
//     } else {
//       Get.snackbar('Login Gagal', response['message']);
//     }
//   }

//   void logout() {
//     // Saat logout, ubah status login menjadi false
//     isLoggedIn.value = false;
//     Get.snackbar('Logout', 'Anda telah logout.');
//   }
// }
