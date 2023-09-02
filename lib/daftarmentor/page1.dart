import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafiaeducation/daftarmentor/confirmpage.dart';

class Page1Mentor extends StatefulWidget {
  const Page1Mentor({super.key});

  @override
  State<Page1Mentor> createState() => _Page1MentorState();
}

class _Page1MentorState extends State<Page1Mentor> {
  String? selectedMethod;
  String? selectedGrade;

  List<String> dropdownItemsMethod = [
    'Online',
    'Offline',
  ];

  List<String> dropdownItemsGrade = [
    'SD',
    'SMP',
  ];

  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  TextEditingController _imageNameController = TextEditingController();
  TextEditingController _imageKTPController = TextEditingController();
  TextEditingController _imageIjazahController = TextEditingController();
  TextEditingController _imageCVController = TextEditingController();

  Future getImageprofile() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image1 = File(pickedImage.path);
        _imageNameController.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageKTP() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image2 = File(pickedImage.path);
        _imageKTPController.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageIjazah() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image3 = File(pickedImage.path);
        _imageIjazahController.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageCV() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image4 = File(pickedImage.path);
        _imageCVController.text = pickedImage.path.split('/').last;
      });
    }
  }

  @override
  void dispose() {
    _imageNameController.dispose();
    _imageKTPController.dispose();
    _imageIjazahController.dispose();
    _imageCVController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Daftar Mentor",
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
                        child: _image1 == null
                            ? Icon(Icons.add_a_photo,
                                size: 50, color: Colors.grey)
                            : Image.file(_image1!, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        getImageprofile();
                      },
                      child: Text(
                        "Upload foto",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0055DF))),
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama lengkap",
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
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Masukkan nama lengkap Kamu",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 20),
                          Text("Alamat lengkap",
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
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Masukkan alamat Kamu",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 20),
                          Text("Nomor telepon",
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
                                      fontWeight: FontWeight.w500)),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "ex.08923203***",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 20),
                          Text("Unggah KTP",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          TextField(
                              onTap: () {
                                getImageKTP();
                              },
                              readOnly: true,
                              controller: _imageKTPController,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.upload_file),
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Unggah KTP Kamu",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 8),
                          Text("*format file berupa .jpeg dan .png",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(height: 20),
                          Text("Unggah ijazah",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          TextField(
                              onTap: () {
                                getImageIjazah();
                              },
                              readOnly: true,
                              controller: _imageIjazahController,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.upload_file),
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Unggah ijazah terakhir",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 8),
                          Text("*format file berupa .jpeg dan .png",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(height: 20),
                          Text("Unggah CV",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          TextField(
                              onTap: () {
                                getImageCV();
                              },
                              readOnly: true,
                              controller: _imageCVController,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.upload_file),
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Unggah CV terbaru",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 8),
                          Text("*format file berupa .jpeg dan .png",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(height: 20),
                          Text("Video mengajar",
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
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Masukkan link video mengajar",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 20),
                          Text("Mata pelajaran",
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
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Mata pelajaran yang diajarkan",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                          SizedBox(height: 20),
                          Text("Tingkat",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.only(right: 16, left: 16),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedGrade,
                                  isExpanded: true,
                                  hint: Text(
                                    'Pilih tingkat Kamu mengajar',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff9a9a9a))),
                                  ),
                                  icon:
                                      SvgPicture.asset("images/arrow-down.svg"),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGrade = newValue;
                                    });
                                  },
                                  items: dropdownItemsGrade.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Metode pembelajaran",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.only(right: 16, left: 16),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedMethod,
                                  isExpanded: true,
                                  hint: Text(
                                    'Pilih metode pembelajaran',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff9a9a9a))),
                                  ),
                                  icon:
                                      SvgPicture.asset("images/arrow-down.svg"),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedMethod = newValue;
                                    });
                                  },
                                  items: dropdownItemsMethod.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Gaji per bulan",
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
                                fillColor: Color(0xffEEEEEE),
                                filled: true,
                                hintText: "Gaji yang diinginkan",
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9A9A9A))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                              )),
                        ]),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => Get.to(ConfirmMentor()),
                        child: Text("Lanjutkan",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(double.infinity, 50),
                            elevation: 0,
                            shadowColor: Colors.white,
                            backgroundColor: Color(0xff8BC523))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
