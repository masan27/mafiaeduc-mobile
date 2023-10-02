import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/register.dart';
import 'package:mafiaeducation/controllers/auth_controller.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/lupapass/page1.dart';
import 'package:mafiaeducation/utils/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiService apiservice = ApiService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Masuk",
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text("Selamat Datang Kembali",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              SizedBox(height: 15),
              Text("Silahkan masuk untuk mengakses akun Anda",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15, color: Color(0xff9A9A9A))),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        controller: emailController,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Color(0xffEEEEEE),
                          filled: true,
                          hintText: "Masukkan email Kamu",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 22, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                    SizedBox(height: 30),
                    Text('Password',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Color(0xffEEEEEE),
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: (() {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black),
                            ),
                          ),
                          hintText: "Masukkan password",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 22, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Get.to(LupaPass1(
                          slug: 'login',
                        )),
                        child: Text("Lupa password?",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff11578A)))),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          Get.dialog(
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                            barrierDismissible: false,
                          );
                          AuthController()
                              .login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text)
                              .then((value) {
                            emailController.clear();
                            passwordController.clear();
                          }).catchError((e) {
                            Get.back();
                            FlashController().flashMessage(
                                FlashMessageType.error,
                                title: FlashController().setProperError(e.toString()));
                          });
                        },
                        child: Text("Masuk",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(double.infinity, 55),
                            elevation: 0,
                            shadowColor: Colors.white,
                            backgroundColor: Color(0xff8BC523))),
                    SizedBox(height: 30),
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
                    SizedBox(height: 30),
                  ],
                ),
              ),
              // SizedBox(
              //     height: 1,
              //     child: Container(
              //       color: Color(0xffD1D7DC),
              //     )),
              // SizedBox(height: 30),
              // Center(
              //   child: Text("Atau masuk dengan",
              //       style: GoogleFonts.inter(
              //           color: Color(0xff9A9A9A), fontSize: 14)),
              // ),
              // SizedBox(height: 30),
              // InkWell(
              //   splashColor: Colors.transparent,
              //   onTap: () {},
              //   child: Center(
              //       child: Image(
              //     image: AssetImage("images/google.png"),
              //     width: 40,
              //   )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
