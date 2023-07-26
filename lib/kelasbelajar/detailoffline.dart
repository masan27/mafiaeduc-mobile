import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailOffline extends StatefulWidget {
  const DetailOffline({super.key});

  @override
  State<DetailOffline> createState() => _DetailOfflineState();
}

class _DetailOfflineState extends State<DetailOffline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Kelas Belajar",
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
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("images/matematika.png"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "Matematika Aljabar",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Rp.50.000",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff11578A))),
                            ),
                          ],
                        ),
                      )
                    ]),
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffEEEEEE)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("images/school.svg",
                                    width: 25),
                                SizedBox(width: 10),
                                Text(
                                  "XII SMA",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff11578A))),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("images/groups.svg",
                                    width: 25),
                                SizedBox(width: 10),
                                Text(
                                  "Kelas Offline",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff11578A))),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
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
                              "Alamat : ",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            Text(
                              "Jl. MH. Thamrin Komplek Anak Mas Gg. Kenanga No. 5",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff11578A))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    child: Text("Daftar Sekarang",
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
