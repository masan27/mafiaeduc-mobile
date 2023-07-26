import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/daftarmentor/page1.dart';
import 'package:mafiaeducation/kelasbelajar/kelasbelajar.dart';
import 'package:mafiaeducation/kelasprivate/kelasprivate.dart';
import 'package:mafiaeducation/materi/materi.dart';
import 'package:mafiaeducation/notifikasi/notifikasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Hi, Raynaldo!",
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Get.to(NotificationPage()),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Cari layanan, pelajaran, & tujuan",
                    hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xff9a9a9a)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xff9a9a9a), width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xff9A9A9A), width: 1)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SvgPicture.asset(
                        "images/search.svg",
                        width: 24,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.to(KelasBelajar()),
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item1.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Kelas Belajar",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(KelasPrivate()),
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item2.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Kelas Private",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(ItemMateri()),
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item3.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Materi",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(Page1Mentor()),
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item4.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Daftar Mentor",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi Mentor",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2),
                      Text("Mentor dengan rating terbaik",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0xff9a9a9a)))
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text("Lihat Semua",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff11578A))),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 275,
              child: Container(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20),
                    InkWell(
                        child: Card(
                      child: Container(
                        width: 250,
                        height: 275,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              height: 150,
                              child: Image.asset("images/sample1.png",
                                  fit: BoxFit.fitHeight),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Juan Antonio",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Matematika",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff9a9a9a)),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Medan Helvetia",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset("images/medal.svg",
                                              width: 25),
                                          SizedBox(width: 5),
                                          Text(
                                            "4.9",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                    InkWell(
                        child: Card(
                      child: Container(
                        width: 250,
                        height: 275,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              height: 150,
                              child: Image.asset("images/sample1.png",
                                  fit: BoxFit.fitHeight),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Juan Antonio",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Matematika",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff9a9a9a)),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Medan Helvetia",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset("images/medal.svg",
                                              width: 25),
                                          SizedBox(width: 5),
                                          Text(
                                            "4.9",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                    InkWell(
                        child: Card(
                      child: Container(
                        width: 250,
                        height: 275,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              height: 150,
                              child: Image.asset("images/sample1.png",
                                  fit: BoxFit.fitHeight),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Juan Antonio",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Matematika",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xff9a9a9a)),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Medan Helvetia",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset("images/medal.svg",
                                              width: 25),
                                          SizedBox(width: 5),
                                          Text(
                                            "4.9",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                    SizedBox(width: 20)
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Telah dibuka!",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(height: 2),
                  Text("Pendaftaran mentor Mafia Education Kenanga",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0xff9a9a9a)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff11578A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/mentor.png", width: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Registrasi Mentor",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white)),
                          Text("Bergabung bersama Mafia Education!",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.white)),
                          SizedBox(height: 15),
                          SizedBox(width: 50),
                          Row(
                            children: [
                              Text("GRATIS!",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white)),
                              SizedBox(width: 30),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Bergabung",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      maximumSize: Size(double.infinity, 50),
                                      elevation: 0,
                                      shadowColor: Colors.white,
                                      backgroundColor: Color(0xff8BC523))),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
