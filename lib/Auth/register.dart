// import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/controllers/auth_controller.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthController _authController = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Daftar",
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
              Text("Buat Akun Baru",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              SizedBox(height: 15),
              Text("Mulailah menuju kesuksesan bersama kami",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15, color: Color(0xff9A9A9A))),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama lengkap",
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        controller: nameController,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Color(0xffEEEEEE),
                          filled: true,
                          hintText: "Masukkan nama Kamu",
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
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Color(0xff8BC523),
                            value: isCheck,
                            checkColor: Colors.white,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue!;
                              });
                            }),
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Dengan melanjutkan, maka saya menyetujui ",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "persyaratan & ketentuan",
                                  style: GoogleFonts.inter(
                                      color: Color(0xff11578A),
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: " yang berlaku ",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Obx(
                      () => ElevatedButton(
                          onPressed: _authController.isRegist.value &&
                                  (isCheck &&
                                      nameController.text != '' &&
                                      emailController.text != '')
                              ? () {
                                  Get.dialog(
                                      Center(
                                          child: CircularProgressIndicator()),
                                      barrierDismissible: false);
                                  _authController.isRegist.value = false;

                                  _authController
                                      .register(
                                    name: nameController.text,
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  )
                                      .then((value) {
                                    nameController.clear();
                                    emailController.clear();
                                    passwordController.clear();
                                    _authController.isRegist.value = true;
                                  }).catchError((e) {
                                    Get.back(closeOverlays: true);
                                    _authController.isRegist.value = true;
                                    FlashController().flashMessage(
                                        FlashMessageType.error,
                                        title: FlashController()
                                            .setProperError(e.toString()));
                                  });
                                }
                              : null,
                          child: Text("Daftar",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              minimumSize: Size(double.infinity, 55),
                              elevation: 0,
                              shadowColor: Colors.white,
                              backgroundColor: Color(0xff8BC523))),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah punya akun?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff9A9A9A))),
                        InkWell(
                          onTap: () => Get.to(LoginPage()),
                          child: Text(" Masuk disini",
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
            ],
          ),
        ),
      ),
    );
  }
}
