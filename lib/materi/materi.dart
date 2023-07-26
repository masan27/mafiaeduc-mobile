import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/materi/detailmateri.dart';

class ItemMateri extends StatefulWidget {
  const ItemMateri({super.key});

  @override
  State<ItemMateri> createState() => _ItemMateriState();
}

class _ItemMateriState extends State<ItemMateri> {
  String? selectedValue;

  List<String> dropdownItems = [
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
          "Materi",
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
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
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
                                          "Jenjang pendidikan",
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
                                              value: selectedValue,
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
                                                  selectedValue = newValue;
                                                });
                                              },
                                              items: dropdownItems
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
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Jenjang pendidikan",
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
                                              value: selectedValue,
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
                                                  selectedValue = newValue;
                                                });
                                              },
                                              items: dropdownItems
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
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                          Text(
                            "XII SMA",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: 'Hanya ',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Rp.75.000',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ),
                                ],
                              )),
                              Text(
                                "Rp.50.000",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              )
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => Get.to(DetailItemMateri()),
                              child: Text("Lihat Materi",
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
