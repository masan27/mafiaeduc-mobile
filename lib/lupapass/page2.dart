import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/password_controller.dart';
import 'package:mafiaeducation/lupapass/page3.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LupaPass2 extends StatefulWidget {
  final String slug;
  const LupaPass2({super.key, required this.slug});

  @override
  State<LupaPass2> createState() => _LupaPass2State();
}

class _LupaPass2State extends State<LupaPass2> {
  final PasswordController _c = Get.find();
  int _start = 59;
  bool _isLoading = true;
  String _buttonText = "Kirim ulang";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (_start < 1) {
          _isLoading = false;
          _buttonText = "Kirim ulang";
          t.cancel();
          return;
        } else {
          _start = _start - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("images/mail.svg", width: 60),
                SizedBox(height: 20),
                Text("Email Verifikasi Terkirim",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                SizedBox(height: 15),
                Text("Masukkan 4 digit kode OTP pada email\nBatman@gmail.com",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 15, color: Color(0xff9A9A9A))),
                SizedBox(height: 30),
                OTPTextField(
                  controller: _c.otpC,
                  outlineBorderRadius: 8,
                  otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Color(0xffeeeeee),
                      focusBorderColor: Color(0xff11578A)),
                  length: 4,
                  width: double.infinity,
                  fieldWidth: MediaQuery.of(context).size.width / 5,
                  style: TextStyle(fontSize: 20),
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    _c.otpInput.text = pin;
                  },
                  onCompleted: (pin) {
                  },
                ),
                SizedBox(height: 30),
                Center(
                  child: _isLoading
                      ? Text(
                          "Tunggu 00:$_start untuk kirim ulang kode",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff8e8e8e),
                                  fontWeight: FontWeight.w400)),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Belum mendapatkan kode? ",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: Color(0xff8e8e8e),
                                        fontWeight: FontWeight.w400)),
                              ])),
                              InkWell(
                                  onTap: () {
                                    _c.forgotPassword({
                                      "email": _c.emailInput.text
                                    }).then((value) {});
                                    _timer?.cancel();
                                    setState(() {
                                      _start = 59;
                                      _isLoading = true;
                                      _buttonText = "Kirim ulang";
                                    });
                                    startTimer();
                                  },
                                  child: Text(_buttonText,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0055DF)))),
                            ]),
                ),
                // Text("Tunggu 00:59 untuk kirim ulang kode",
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.inter(
                //         fontSize: 15, color: Color(0xff9A9A9A))),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Get.off(LoginPage()),
                      style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Color(0xff8BC523)),
                          minimumSize: Size(160, 60),
                          elevation: 0,
                          primary: Color(0xff8BC523),
                          shadowColor: Colors.white),
                      child: Text("Batal",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_c.otpInput.text.isEmpty) {
                            FlashController().flashMessage(
                                FlashMessageType.warning,
                                title: 'OTP wajib di isi');
                          } else {
                            Get.dialog(
                                Center(child: CircularProgressIndicator()),
                                barrierDismissible: false);
                            _c.verifyOTP({
                              "email": _c.emailInput.text,
                              "otp": _c.otpInput.text
                            }).then((value) {
                              Get.back();
                              Get.off(LupaPass3(
                                slug: widget.slug,
                              ));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(160, 60),
                            primary: Color(0xff8BC523),
                            elevation: 0,
                            shadowColor: Colors.white),
                        child: Text("Lanjutkan",
                            style: GoogleFonts.inter(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
