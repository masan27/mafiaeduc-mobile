import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AkunSaya extends StatefulWidget {
  const AkunSaya({super.key});

  @override
  State<AkunSaya> createState() => _AkunSayaState();
}

class _AkunSayaState extends State<AkunSaya> {
  String? selectedGender;

  TextEditingController namaController = TextEditingController();

  List<String> dropdownItems = [
    'Perempuan',
    'Laki-Laki',
  ];

  TextEditingController dateTLahirController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateTLahirController.text = "";
  }

  Future getImagepAkun() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Akun Saya",
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            Image(image: AssetImage("images/matematika.png")),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        getImagepAkun();
                      },
                      child: Text(
                        "Ubah foto profil",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0055DF))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Nama",
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
                                          "Ganti Nama",
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
                                                    "Isi Nama Lengkapmu",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              TextField(
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
                                                    hintText: "Ganti Nama",
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
                              "Harley Davidson",
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Jenis Kelamin",
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
                                          "Jenis Kelamin",
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
                                                  "Jenis Kelamin",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
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
                                                        color:
                                                            Color(0xff9a9a9a)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15, left: 15),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      value: selectedGender,
                                                      isExpanded: true,
                                                      hint: Text(
                                                        'Pilih Jenis Kelamin',
                                                        style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xff9a9a9a))),
                                                      ),
                                                      icon: SvgPicture.asset(
                                                          "images/arrow-down.svg"),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          selectedGender =
                                                              newValue;
                                                        });
                                                      },
                                                      items: dropdownItems
                                                          .map((String item) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        14,
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
                              "Laki-Laki",
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tanggal Lahir (dd/mm/yyyy)",
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
                                          "Tanggal Lahir",
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
                                                child: Text("Tanggal Lahir",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              TextField(
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedData =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2100));
                                                    if (pickedData != null) {
                                                      String formattedDate =
                                                          DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .format(
                                                                  pickedData);
                                                      setState(() {
                                                        dateTLahirController
                                                                .text =
                                                            formattedDate
                                                                .toString();
                                                      });
                                                    } else {
                                                      print("Not selected");
                                                    }
                                                  },
                                                  controller:
                                                      dateTLahirController,
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
                                                    hintText: "Tanggal lahir",
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
                                                              55),
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
                              "Harley Davidson",
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
