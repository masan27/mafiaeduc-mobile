import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/kelasbelajar/detailoffline.dart';
import 'package:mafiaeducation/kelasbelajar/detailonline.dart';
import 'package:mafiaeducation/kelasprivate/detailprivate.dart';

class KelasPrivate extends StatefulWidget {
  const KelasPrivate({super.key});

  @override
  State<KelasPrivate> createState() => _KelasPrivateState();
}

class _KelasPrivateState extends State<KelasPrivate> {
  String? selectedValueMapel;
  String? selectedValueTipe;

  List<String> dropdownItemsMapel = [
    'Paket A',
    'Paket B',
  ];

  List<String> dropdownItemsTipe = [
    'Online',
    'Onfline',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Kelas Private",
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
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      context: context,
                      builder: (context) => StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
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
                                            "Paket",
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
                                                value: selectedValueMapel,
                                                isExpanded: true,
                                                hint: Text(
                                                  'Pilih paket belajar',
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff9a9a9a))),
                                                ),
                                                icon: SvgPicture.asset(
                                                    "images/arrow-down.svg"),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueMapel =
                                                        newValue;
                                                  });
                                                },
                                                items: dropdownItemsMapel
                                                    .map((String item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
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
                                                value: selectedValueTipe,
                                                isExpanded: true,
                                                hint: Text(
                                                  'Pilih tipe pembelajaran',
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff9a9a9a))),
                                                ),
                                                icon: SvgPicture.asset(
                                                    "images/arrow-down.svg"),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueTipe =
                                                        newValue;
                                                  });
                                                },
                                                items: dropdownItemsTipe
                                                    .map((String item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black)),
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
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }));
                },
                child: SvgPicture.asset("images/filter.svg")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
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
                          RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: "Joseph Ken",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(width: 50),
                          SvgPicture.asset("images/offline.svg")
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Matematika",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff11578A))),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Jl.Sunggal No.455a, Kec.Medan-Sunggal",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff9A9A9A))),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () => Get.to(DetailPrivate()),
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
          ],
        ),
      ),
    );
  }
}
