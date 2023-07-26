import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/lupapass/page3.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LupaPass2 extends StatefulWidget {
  const LupaPass2({super.key});

  @override
  State<LupaPass2> createState() => _LupaPass2State();
}

class _LupaPass2State extends State<LupaPass2> {
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
                Text("Masukkan 6 digit kode OTP pada email\nBatman@gmail.com",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 15, color: Color(0xff9A9A9A))),
                SizedBox(height: 30),
                OTPTextField(
                  outlineBorderRadius: 8,
                  otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Color(0xffeeeeee),
                      focusBorderColor: Color(0xff11578A)),
                  length: 6,
                  width: double.infinity,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 20),
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("complete: $pin");
                  },
                ),
                SizedBox(height: 30),
                Text("Tunggu 00:59 untuk kirim ulang kode",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Get.to(LoginPage()),
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
                        onPressed: () => Get.to(LupaPass3()),
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
