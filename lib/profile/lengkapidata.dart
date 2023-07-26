import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'akunsaya.dart';

class LengkapiData extends StatefulWidget {
  const LengkapiData({super.key});

  @override
  State<LengkapiData> createState() => _LengkapiDataState();
}

class _LengkapiDataState extends State<LengkapiData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Lengkapi Data",
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Asal Sekolah",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(AkunSaya()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SMA Methodist 2",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Kelas",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(AkunSaya()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "XII IPA",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Instagram",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Harley Davidson",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Facebook",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Harley Davidson",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    minimumSize: Size(160, 50),
                    primary: Color(0xff8BC523),
                    elevation: 0,
                    shadowColor: Colors.white),
                child: Text("Simpan",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w600))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
