import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/checkout/waitingpay.dart';

class checkout3 extends StatefulWidget {
  const checkout3({super.key});

  @override
  State<checkout3> createState() => _checkout3State();
}

class _checkout3State extends State<checkout3> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Konfirmasi Pembayaran",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama pengirim",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          // fillColor: Color(0xffEEEEEE),
                          // filled: true,
                          hintText: "Nama pengirim",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Tanggal transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedData = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          if (pickedData != null) {
                            String formattedDate =
                                DateFormat("dd-MM-yyyy").format(pickedData);
                            setState(() {
                              dateController.text = formattedDate.toString();
                            });
                          } else {
                            print("Not selected");
                          }
                        },
                        controller: dateController,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          // fillColor: Color(0xffEEEEEE),
                          // filled: true,
                          hintText: "Tanggal transfer",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Nominal transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        // fillColor: Color(0xffEEEEEE),
                        // filled: true,
                        hintText: "Masukan nominal transfer",
                        hintStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff9A9A9A),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xff9a9a9a),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xff9a9a9a),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Metode pembayaran",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          // fillColor: Color(0xffEEEEEE),
                          // filled: true,
                          hintText: "ex. Transfer Bank BCA",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Bukti transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    _image == null
                        ? Text('Klik unggah gambar')
                        : Image.file(_image!),
                    ElevatedButton(
                      onPressed: getImage,
                      child: Text('Unggah Gambar'),
                    ),
                  ],
                ),
              )
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
                    onPressed: () => Get.to(WaitingPay()),
                    child: Text("Submit",
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
