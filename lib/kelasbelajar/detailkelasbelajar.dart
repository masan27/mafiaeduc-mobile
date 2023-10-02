import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/checkout/checkout.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/learning_class_controller.dart';
import 'package:mafiaeducation/models/learning_class_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailKelasBelajar extends StatefulWidget {
  final int id;
  const DetailKelasBelajar({super.key, required this.id});

  @override
  State<DetailKelasBelajar> createState() => _DetailKelasBelajar();
}

class _DetailKelasBelajar extends State<DetailKelasBelajar> {
  final LearningClassController _learningClassController =
      Get.put(LearningClassController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _learningClassController
        .getDetailLeariningClass(widget.id)
        .catchError((e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title: FlashController().setProperError(e.toString()));
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tambahkan kode yang ingin dijalankan sebelum keluar dari layar
        // Ini akan dipanggil saat pengguna menekan tombol "Back"
        await _learningClassController.getLearningClasses({});
        return true; // Kembalikan true jika Anda ingin keluar dari layar
      },
      child: Scaffold(
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
        body: SingleChildScrollView(child: Obx(() {
          if (_learningClassController.isLoadingDetail.value) {
            return const SkeletonDetailKelasBelajar();
            // Center(
            //   child: Padding(
            //       padding: EdgeInsets.only(top: 50),
            //       child: Text("Memuat Data")),
            // );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                              image: DecorationImage(
                                  image: AssetImage("images/matematika.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text:
                                      "${_learningClassController.detail.value.title}",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                _learningClassController.detail.value.price ==
                                        null
                                    ? '-'
                                    : NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(int.parse(
                                            _learningClassController
                                                .detail.value.price
                                                .toString())),
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff11578A))),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
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
                            "Deskripsi",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 10),
                          Html(
                            data: "${_learningClassController.detail.value.description}",
                            // style: GoogleFonts.inter(
                            //     textStyle: TextStyle(
                            //         fontWeight: FontWeight.normal,
                            //         color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("images/school.svg",
                                      width: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    "${_learningClassController.detail.value.grade?.name}",
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
                                  SvgPicture.asset("images/groups.svg",
                                      width: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    "Kelas ${_learningClassController.detail.value.learningMethod?.name}",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff11578A))),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: _learningClassController
                                    .detail.value.learningMethod?.id ==
                                1
                            ? false
                            : true,
                        child: Container(
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
                                  "Alamat : ",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                Text(
                                  "${_learningClassController.detail.value.additionalInfo}",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff11578A))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        })),
        bottomNavigationBar: Container(
          height: 100,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      final toMap = LearningClass()
                          .toCheckout(_learningClassController.detail.value);
                      Get.to(CheckoutPage(
                        checkoutParams: toMap,
                        typeId: 2,
                      ));
                    },
                    child: Text("Daftar Sekarang",
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
        ),
      ),
    );
  }
}

class SkeletonDetailKelasBelajar extends StatelessWidget {
  const SkeletonDetailKelasBelajar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Color.fromRGBO(122, 118, 118, 1),
        highlightColor: Color.fromRGBO(255, 255, 255, 1),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 150,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 18),
                          Container(
                            width: MediaQuery.of(context).size.width - 250,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 30.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8),
                          Container(
                            width: 130,
                            height: 40.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Container(
                            width: 130,
                            height: 40.0,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 220,
                                height: 30.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
