import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/grade_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/models/grade_model.dart';

class LengkapiData extends StatefulWidget {
  const LengkapiData({super.key});

  @override
  State<LengkapiData> createState() => _LengkapiDataState();
}

class _LengkapiDataState extends State<LengkapiData> {
  final UserController _userController = Get.find();
  final GradeController _gradeController = Get.put(GradeController());
  final TextEditingController _originInput = TextEditingController();
  Grade? selectedGrade;

  RxString _originText = "-".obs;
  RxString _gradeText = "-".obs;
  DateTime? pickedData;

  @override
  void initState() {
    super.initState();

    // set text input
    if (_userController.user.value.schoolOrigin != null) {
      _originText.value = _userController.user.value.schoolOrigin.toString();
      _originInput.text = _userController.user.value.schoolOrigin.toString();
    }
    if (_userController.user.value.grade != null) {
      _gradeText.value = _userController.user.value.grade.toString();
    }
  }

  @override
  void dispose() {
    _originInput.dispose();

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
          "Lengkapi Data",
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
                        "Asal Sekolah",
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
                                          "Asal Sekolah",
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
                                                child: Text("Nama Sekolah",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              SizedBox(height: 8),
                                              TextField(
                                                  controller: _originInput,
                                                  onChanged: (value) =>
                                                      _originText.value = value,
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
                                                        "Isi Nama Sekolah",
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
                                                  onPressed: () {
                                                    Get.back();
                                                  },
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
                            Obx(
                              () => Text(
                                _originText.value,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              ),
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
                        "Tingkat",
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
                                          "Pilih Tingkat",
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
                                                  "Tingkatan Kamu",
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
                                                        DropdownButton<Grade>(
                                                      value: selectedGrade,
                                                      isExpanded: true,
                                                      hint: Text(
                                                        'Pilih Tingkatan Kelas',
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
                                                          (Grade? newValue) {
                                                        print(newValue);
                                                        setState(() {
                                                          selectedGrade =
                                                              newValue!;
                                                          _gradeText.value =
                                                              newValue.name
                                                                  .toString();
                                                        });
                                                      },
                                                      items: _gradeController
                                                          .grades
                                                          .map<
                                                              DropdownMenuItem<
                                                                  Grade>>((Grade
                                                              item) {
                                                        return DropdownMenuItem<
                                                            Grade>(
                                                          value: item,
                                                          child: Text(
                                                            item.name
                                                                .toString(),
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
                                                  onPressed: () {
                                                    Get.back();
                                                  },
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
                            Obx(
                              () => Text(
                                _gradeText.value,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              ),
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
                onPressed: () {
                  Get.dialog(
                      barrierDismissible: false,
                      Center(
                        child: CircularProgressIndicator(),
                      ));
                  _userController
                      .updateUser({
                        "full_name": _userController.user.value.fullName,
                        "school_origin": _originInput.text,
                        "grade_id": selectedGrade?.id.toString(),
                      })
                      .then((value) => _userController.getUser().then((value) {
                            Get.back();
                            FlashController().flashMessage(
                                FlashMessageType.success,
                                title: 'Berhasil menyimpan data');
                          }))
                      .catchError((e) {
                        Get.back();
                        FlashController().flashMessage(FlashMessageType.error,
                            title:FlashController().setProperError(e.toString()));
                      });
                },
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
