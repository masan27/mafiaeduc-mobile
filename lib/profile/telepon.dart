import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Telepon extends StatefulWidget {
  const Telepon({super.key});

  @override
  State<Telepon> createState() => _TeleponState();
}

class _TeleponState extends State<Telepon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Nomor Handphone",
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
                        "Nomor Handphone",
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
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 10),
                                        SizedBox(
                                            child: Container(
                                          height: 5,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Color(0xff9A9A9A),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        )),
                                        SizedBox(height: 30),
                                        Text(
                                          "Ubah Nomor",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                        SizedBox(height: 20),
                                        SizedBox(
                                            child: Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: Color(0xff9a9a9a),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 30),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    "Nomor Handphone Baru",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  cursorColor: Colors.black,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffEEEEEE),
                                                    filled: true,
                                                    hintText:
                                                        "Isi Nomor Baru Kamu",
                                                    hintStyle: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff9A9A9A))),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 16,
                                                            horizontal: 20),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                  )),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Ganti",
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18)),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          shape:
                                                              StadiumBorder(),
                                                          minimumSize: Size(
                                                              double.infinity,
                                                              50),
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          backgroundColor:
                                                              Color(
                                                                  0xff8BC523))),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "082328474823",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.black)),
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
