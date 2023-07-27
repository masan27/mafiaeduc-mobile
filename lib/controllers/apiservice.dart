// // api_service.dart
// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String baseUrl =
//       'https://api-test.mutualproperty.co.id/v1'; // Ganti dengan URL API yang sesuai

//   Future<Map<String, dynamic>> register(
//       String name, String email, String password) async {
//     try {
//       final response =
//           await http.post(Uri.parse('$baseUrl/auth/register'), body: {
//         'name': name,
//         'email': email,
//         'password': password,
//       });
//       print(response);

//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else {
//         return {
//           'status': 'error',
//           'message': 'Terjadi kesalahan saat melakukan registrasi.'
//         };
//       }
//     } catch (e) {
//       print('Error: $e');
//       return {
//         'status': 'error',
//         'message': 'Terjadi kesalahan saat melakukan registrasi.'
//       };
//     }
//   }

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       print(Uri.parse('$baseUrl/auth/login'));
//       final response = await http.post(Uri.parse('$baseUrl/auth/login'), body: {
//         'email': email,
//         'password': password,
//       }, headers: {
//         "Accept": "application/json"
//       });

//       if (response.statusCode == 200) {
//         log("message");
//         return json.decode(response.body);
//       } else {
//         return {'status': 'error', 'message': 'Email atau password salah.'};
//       }
//     } catch (e) {
//       log('Error: $e');
//       return {'status': 'error', 'message': 'Terjadi kesalahan saat login.'};
//     }
//   }
// }
