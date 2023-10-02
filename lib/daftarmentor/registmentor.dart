import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/grade_controller.dart';
import 'package:mafiaeducation/controllers/learning_type_controller.dart';
import 'package:mafiaeducation/controllers/mentor_controller.dart';
import 'package:mafiaeducation/controllers/subject_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/daftarmentor/confirmpage.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegistMentor extends StatefulWidget {
  const RegistMentor({super.key});

  @override
  State<RegistMentor> createState() => _RegistMentorState();
}

class _RegistMentorState extends State<RegistMentor> {
  final UserController _userController = Get.find();
  final GradeController _gradeController = Get.put(GradeController());
  final LearningTypeController _learningTypeController =
      Get.put(LearningTypeController());
  final SubjectController _subjectController = Get.put(SubjectController());
  final MentorController _mentorController = Get.put(MentorController());

  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _addressInput = TextEditingController();
  final TextEditingController _phoneInput = TextEditingController();
  final TextEditingController _linkVideoInput = TextEditingController();
  final TextEditingController _salaryInput = TextEditingController();
  final TextEditingController _linkedinInput = TextEditingController();
  final TextEditingController _imageNameInput = TextEditingController();
  final TextEditingController _imageKTPInput = TextEditingController();
  final TextEditingController _imageIjazahInput = TextEditingController();
  final TextEditingController _imageCVInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameInput.text = _userController.user.value.fullName ?? '';
    _addressInput.text = _userController.user.value.address ?? '';
    _phoneInput.text = _userController.user.value.phone ?? '';

    _nameInput.addListener(_validateForm);
    _addressInput.addListener(_validateForm);
    _phoneInput.addListener(_validateForm);
    _linkVideoInput.addListener(_validateForm);
    _salaryInput.addListener(_validateForm);
    _linkedinInput.addListener(_validateForm);
    _imageNameInput.addListener(_validateForm);
    _imageKTPInput.addListener(_validateForm);
    _imageIjazahInput.addListener(_validateForm);
    _imageCVInput.addListener(_validateForm);
  }

  // Validation function
  void _validateForm() {
    setState(() {
      // Check if both text fields are not empty
      canSubmit = _nameInput.text.isNotEmpty &&
          _addressInput.text.isNotEmpty &&
          _phoneInput.text.isNotEmpty &&
          // isValidUrl("Video Mengajar", _linkVideoInput.text) &&
          _linkVideoInput.text.isNotEmpty &&
          _salaryInput.text.isNotEmpty &&
          _imageNameInput.text.isNotEmpty &&
          _imageKTPInput.text.isNotEmpty &&
          _imageIjazahInput.text.isNotEmpty &&
          _imageCVInput.text.isNotEmpty;
      // isValidUrl("LinkedIn", _linkVideoInput.text);
    });
  }

  bool isValidUrl(String param, String url) {
    // Regular expression to validate URLs (HTTP and HTTPS)
    final urlPattern = RegExp(
      r'^(https?|ftp|file):\/\/[-A-Za-z0-9+&@#\/%?=~_|!:,.;]+[-A-Za-z0-9+&@#\/%=~_|]',
    );
    if (param == 'LinkedIn') {
      if (url == '') return true;
    }
    if (urlPattern.hasMatch(url)) {
      return true;
    } else {
      if (param == 'Video Mengajar' && url == '') {
        return false;
      } else {
        FlashController().flashMessage(FlashMessageType.warning,
            title: "URL $param tidak valid");
        return false;
      }
    }
  }

  List<int?>? selectedSubjects;
  String? selectedMethod;
  String? selectedGrade;

  File? _imagePhoto;
  File? _imageKTP;
  File? _imageIjazah;
  File? _imageCV;
  bool canSubmit = false;

  Future getImageprofile() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imagePhoto = File(pickedImage.path);
        _imageNameInput.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageKTP() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageKTP = File(pickedImage.path);
        _imageKTPInput.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageIjazah() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageIjazah = File(pickedImage.path);
        _imageIjazahInput.text = pickedImage.path.split('/').last;
      });
    }
  }

  Future getImageCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.single;
      String filePath = file.path!;
      // Memeriksa ekstensi berkas
      if (filePath.endsWith('.pdf')) {
        // Berkas yang dipilih adalah PDF, lakukan sesuatu dengan berkas tersebut.
        setState(() {
          _imageCV = File(filePath);
          _imageCVInput.text = filePath.split('/').last;
        });
      } else {
        FlashController().flashMessage(FlashMessageType.warning,
            title: "cv harus berupa file pdf");
      }
    }
  }

  @override
  void dispose() {
    _nameInput.dispose();
    _addressInput.dispose();
    _phoneInput.dispose();
    _linkVideoInput.dispose();
    _linkedinInput.dispose();
    _salaryInput.dispose();
    _imageNameInput.dispose();
    _imageKTPInput.dispose();
    _imageIjazahInput.dispose();
    _imageCVInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _imagePhoto == null
                        ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                        : Image.file(_imagePhoto!, fit: BoxFit.cover),
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
                        controller: _nameInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        controller: _addressInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        controller: _phoneInput,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        controller: _imageKTPInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        controller: _imageIjazahInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        controller: _imageCVInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                    SizedBox(height: 8),
                    Text("*format file berupa .pdf",
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
                        controller: _linkVideoInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                    Obx(() {
                      return Container(
                          // height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(right: 16, left: 16),
                            child:
                                MultiSelectDialogField(
                              title: Text("Pilih maksimal 3"),
                              buttonText: Text("Pilih mata pelajaran"),
                              selectedColor: Colors.green[600],
                              selectedItemsTextStyle: TextStyle(color: Colors.white),
                              buttonIcon: Icon(Icons.keyboard_arrow_down),
                              items: _subjectController.subjects
                                  .map((item) =>
                                      MultiSelectItem(item.id, item.name.toString()))
                                  .toList(),
                              listType: MultiSelectListType.CHIP,
                              onConfirm: (values) {
                                selectedSubjects = values;
                              },
                            ),
                          ));
                    }),
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
                            icon: SvgPicture.asset("images/arrow-down.svg"),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGrade = newValue;
                              });
                            },
                            items: _gradeController.grades
                                .map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem<String>(
                                value: item.id.toString(),
                                child: Text(
                                  item.name.toString(),
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
                            icon: SvgPicture.asset("images/arrow-down.svg"),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMethod = newValue;
                              });
                            },
                            items: _learningTypeController.learningTypes
                                .map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem<String>(
                                value: item.id.toString(),
                                child: Text(
                                  item.name!,
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
                        controller: _salaryInput,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                    SizedBox(height: 20),
                    Text("LinkedIn",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        controller: _linkedinInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Color(0xffEEEEEE),
                          filled: true,
                          hintText: "Masukkan LinkedIn kamu jika ada",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9A9A9A))),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                    SizedBox(height: 20),
                  ],
                ),
                Opacity(
                  opacity: canSubmit ? 1.0 : 0.5,
                  child: ElevatedButton(
                      onPressed: () {
                        if (canSubmit) {
                          _mentorController.registMentor({
                            "learning_method_id": selectedMethod,
                            "grade_id": selectedGrade,
                            "full_name": _nameInput.text,
                            "address": _addressInput.text,
                            "teaching_video": _linkVideoInput.text,
                            "phone": _phoneInput.text,
                            "salary": _salaryInput.text,
                            "subject": selectedSubjects,
                          }, {
                            "photo": _imagePhoto!.path,
                            "certificate": _imageIjazah!.path,
                            "identity_card": _imageKTP!.path,
                            "cv": _imageCV!.path,
                          }).then((value) => Get.off(const ConfirmMentor()));
                        }
                      },
                      child: Text("Lanjutkan",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 50),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color(0xff8BC523))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
