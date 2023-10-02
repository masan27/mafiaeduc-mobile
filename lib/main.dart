import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/homeScreen/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(MyApp());
  });
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final ApiService authController = Get.put(ApiService());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mafia Education',
      home: CheckAuth(),
      initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/Welcomescreen', page: () => WelcomeScreen()),
      // ],
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  final UserController _userController =
      Get.put(UserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = const BottomBar();
    } else {
      child = const WelcomeScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}
