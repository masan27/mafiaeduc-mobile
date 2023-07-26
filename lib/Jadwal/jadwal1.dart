import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Jadwal/offlinedetail.dart';

import 'detailjadwal.dart';

class Jadwal1 extends StatefulWidget {
  const Jadwal1({super.key});

  @override
  State<Jadwal1> createState() => _Jadwal1State();
}

class _Jadwal1State extends State<Jadwal1> {
  String? selectedTipe;

  List<String> dropdownTipe = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Jadwal",
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              child: SvgPicture.asset("images/filter.svg"),
              onTap: (() {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
                            height: 330,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                SizedBox(
                                    child: Container(
                                  height: 5,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xff9A9A9A),
                                      borderRadius: BorderRadius.circular(50)),
                                )),
                                SizedBox(height: 30),
                                Text(
                                  "Filter",
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
                                          "Tipe pembelajaran",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xff9a9a9a)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 15, left: 15),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedTipe,
                                              isExpanded: true,
                                              hint: Text(
                                                'Pilih jenjang pendidikan',
                                                style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff9a9a9a))),
                                              ),
                                              icon: SvgPicture.asset(
                                                  "images/arrow-down.svg"),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedTipe = newValue;
                                                });
                                              },
                                              items: dropdownTipe
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Filter",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18)),
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder(),
                                              minimumSize:
                                                  Size(double.infinity, 55),
                                              elevation: 0,
                                              shadowColor: Colors.white,
                                              backgroundColor:
                                                  Color(0xff8BC523))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }));
              }),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE)),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Matematika Aljabar",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SvgPicture.asset("images/offline.svg")
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "XII SMA",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                              Text(
                                "Senin, 19.00 - 20.00",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7495A8))),
                              ),
                              Text(
                                "Mentor by Joseph Kahn",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7495A8))),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => Get.to(offlinePage()),
                              child: Text("Lihat Detail",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                              style: ElevatedButton.styleFrom(
                                  // shape: StadiumBorder(),
                                  maximumSize: Size(double.infinity, 50),
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  backgroundColor: Color(0xff8BC523))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE)),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Matematika Aljabar",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SvgPicture.asset("images/online.svg")
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "XII SMA",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                              Text(
                                "Selasa, 19.00 - 20.00",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7495A8))),
                              ),
                              Text(
                                "Mentor by Joseph Kahn",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7495A8))),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => Get.to(DetailJadwal()),
                              child: Text("Lihat Detail",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                              style: ElevatedButton.styleFrom(
                                  // shape: StadiumBorder(),
                                  maximumSize: Size(double.infinity, 50),
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  backgroundColor: Color(0xff8BC523))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
