import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailJadwal extends StatefulWidget {
  const DetailJadwal({super.key});

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
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
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage("images/matematika.png")),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harley Davidson",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Matematika",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff11578A))),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Column(
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
                      child: Column(
                        children: [
                          Row(
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
                                  SvgPicture.asset("images/kelasonline.svg",
                                      width: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    "Kelas Online",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff11578A))),
                                  )
                                ],
                              )
                            ],
                          )
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
                            "Tata tertib",
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
                          Row(
                            children: [
                              // SvgPicture.asset("images/zoomlogo.svg",
                              //     width: 60),
                              // SvgPicture.asset("images/zoomlogo.svg",
                              //     width: 60),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Link : ",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Text(
                              "https://KelasMatematikaJosephKenasasswdefrvrsasasasacacweefvsads",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff11578A))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Container(
            height: 150,
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(children: [
                  Text(
                    "Butuh bantuan?\nSilahkan hubungi via WhatsApp di bawah ini!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff9A9A9A))),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Chat Via WhatsApp",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 55),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color(0xff8BC523))),
                ]))));
  }
}
