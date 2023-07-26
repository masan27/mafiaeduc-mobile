import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/lupapass/page4.dart';

class LupaPass3 extends StatefulWidget {
  const LupaPass3({super.key});

  @override
  State<LupaPass3> createState() => _LupaPass3State();
}

class _LupaPass3State extends State<LupaPass3> {
  bool _obscureText = true;
  bool _obscureText1 = true;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Password baru',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              TextField(
                  obscureText: _obscureText,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
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
                    hintText: "Masukkan password baru",
                    hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9A9A9A))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  )),
              SizedBox(height: 30),
              Text('Konfirmasi password baru',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              TextField(
                  obscureText: _obscureText1,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEEEEEE),
                    filled: true,
                    suffixIcon: GestureDetector(
                      onTap: (() {
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                            _obscureText1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black),
                      ),
                    ),
                    hintText: "Konfirmasi password",
                    hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9A9A9A))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 150,
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
                        onPressed: () => Get.to(LupaPass4()),
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
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Punya kendala?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 14, color: Color(0xff9A9A9A))),
                    InkWell(
                      onTap: () {},
                      child: Text(" Hubungi kami",
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
        ));
  }
}
