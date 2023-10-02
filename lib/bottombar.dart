import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/Jadwal/jadwal1.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/homeScreen/homescreen.dart';
import 'package:mafiaeducation/materiku/materiku1.dart';
import 'package:mafiaeducation/profile/profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List<Widget> screen = [
    const HomePage(),
    const Jadwal1(),
    const Materiku1(),
    const AkunPage(),
  ];
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_selectedIndex],
        bottomNavigationBar: Container(
          height: 70,
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (value) {
                if (!userController.userExists.value && value == 3) {
                  Get.to(const LoginPage());
                } else {
                  setState(() {
                    _selectedIndex = value;
                  });
                }
              },
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              unselectedFontSize: 14,
              selectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white),
              unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white),
              items: [
                BottomNavigationBarItem(
                    icon: _selectedIndex == 0
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                SvgPicture.asset("images/home.svg", width: 25),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("images/homenonactive.svg",
                                width: 25),
                          ),
                    label: "Beranda"),
                BottomNavigationBarItem(
                    icon: _selectedIndex == 1
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("images/calender.svg",
                                width: 25),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "images/calendernonactive.svg",
                                width: 25),
                          ),
                    label: "Jadwal"),
                BottomNavigationBarItem(
                    icon: _selectedIndex == 2
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("images/materi.svg",
                                width: 25),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "images/materinonactive.svg",
                                width: 25),
                          ),
                    label: "Materiku"),
                BottomNavigationBarItem(
                    icon: _selectedIndex == 3
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("images/profile.svg",
                                width: 25),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "images/profilenonactive.svg",
                                width: 25),
                          ),
                    label: userController.userExists.value ? "Akun" : "Login")
              ],
              elevation: 2,
            ),
          ),
        ));
  }
}
