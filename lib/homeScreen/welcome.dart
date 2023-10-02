import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:get/get.dart';
import 'package:mafiaeducation/Auth/register.dart';
import 'package:mafiaeducation/bottombar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  // color: Colors.orange,
                  child: Image.asset("images/vector1.png"),
                  width: 280,
                ),
              ),
              SizedBox(height: 30),
              Text("Sahabat Terbaik di Setiap Belajarmu",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 30),
              Text(
                  "Kami menyediakan program belajar yang efektif\ndan menyenangkan agar Anda bisa belajar dengan\nlebih mudah.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 14, color: Color(0xff9A9A9A))),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () => Get.off(BottomBar()),
                  child: Text("Eksplore aplikasi",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(double.infinity, 55),
                      elevation: 0,
                      shadowColor: Colors.white,
                      backgroundColor: Color(0xff8BC523))),
              SizedBox(height: 15),
              OutlinedButton(
                  onPressed: () => Get.to(LoginPage()),
                  child: Text("Login sekarang",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff8BC523))),
                  style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(double.infinity, 55),
                      elevation: 0,
                      shadowColor: Colors.white,
                      side: BorderSide(color: Color(0xff8BC523)))),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xff9A9A9A))),
                  InkWell(
                    onTap: () => Get.to(Register()),
                    child: Text(" Daftar disini",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff11578A))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
