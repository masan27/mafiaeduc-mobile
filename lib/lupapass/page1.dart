import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/lupapass/page2.dart';

class LupaPass1 extends StatefulWidget {
  const LupaPass1({super.key});

  @override
  State<LupaPass1> createState() => _LupaPass1State();
}

class _LupaPass1State extends State<LupaPass1> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Email",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            TextField(
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                )),
          ]),
        ),
        bottomNavigationBar: Container(
          height: 150,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => Get.to(LupaPass2()),
                    child: Text("Lanjutkan",
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
