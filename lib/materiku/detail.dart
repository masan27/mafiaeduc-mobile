import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMateri extends StatefulWidget {
  const DetailMateri({super.key});

  @override
  State<DetailMateri> createState() => _DetailMateriState();
}

class _DetailMateriState extends State<DetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Detail Materi",
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
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Container(
                  // height: 150,
                  width: double.infinity,
                  // color: Colors.black,
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("images/matematika.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 100,
                      // width: 260,
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Matematika Aljabar",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff11578A))),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "XII SMA",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Author: Joseph Khen",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff9a9a9a))),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "88 Halaman",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff9a9a9a))),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 1,
                child: Container(
                  color: Color(0xffd9d9d9),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffEEEEEE)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Belajar Matematika, jadi jago perhitungan cepat dan cara jitu dan mudah dalam perhitungan rumit sekalipun. Mari mulai belajar Matematika sekarang!",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffEEEEEE)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Keuntungan yang didapat",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "• Akses materi selamanya\n• Contoh soal dan latiha\n• Rangkuman materi\n• Cara cepat jawab soal\n• Trik dan tips pemecahan masalah\n• Contoh soal Try Out Premium dan Study guide",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Unduh materi",
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
