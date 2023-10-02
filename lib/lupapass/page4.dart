import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/controllers/password_controller.dart';
import 'package:mafiaeducation/profile/profile.dart';

class LupaPass4 extends StatefulWidget {
  final String slug;
  const LupaPass4({super.key, required this.slug});

  @override
  State<LupaPass4> createState() => _LupaPass4State();
}

class _LupaPass4State extends State<LupaPass4> {
  PasswordController _c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Lupa Password",
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("images/check.svg", width: 60),
                SizedBox(height: 20),
                Text("Password Diperbaharui",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                SizedBox(height: 15),
                Text("Anda telah berhasil memperbaharui\npassword anda!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 15, color: Color(0xff9A9A9A))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (widget.slug == 'login') {
                        Get.to(const LoginPage());
                      } else {
                        Get.to(const AkunPage());
                      }
                      _c.onClose();
                    },
                    child: Text("Kembali ke login",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(double.infinity, 55),
                        elevation: 0,
                        shadowColor: Colors.white,
                        backgroundColor: Color(0xff8BC523))),
              ],
            ),
          ),
        ));
  }
}
