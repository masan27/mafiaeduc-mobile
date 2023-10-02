import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/checkout/checkout.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/private_class_controller.dart';
import 'package:mafiaeducation/kelasprivate/kelasprivate.dart';
import 'package:mafiaeducation/models/private_class_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailPrivate extends StatefulWidget {
  final int id;
  const DetailPrivate({super.key, required this.id});

  @override
  State<DetailPrivate> createState() => _DetailPrivateState();
}

class _DetailPrivateState extends State<DetailPrivate> {
  final PrivateClassController _privateClassController =
      Get.put(PrivateClassController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _privateClassController
        .getDetailPrivateClass(widget.id)
        .catchError((e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title: FlashController().setProperError(e.toString()));
      Get.back();
    });
  }

  final String defaultImage =
      'https://w7.pngwing.com/pngs/260/984/png-transparent-classroom-comanche-springs-elementary-classroom-with-green-board-and-desks-brown-desks-with-blackboard-illustration-furniture-class-rectangle.png';

  @override
  Widget build(BuildContext context) {
    // final detail = _privateClassController.privateClassDetail.value;
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
        ),
        body: SingleChildScrollView(child: Obx(() {
          if (_privateClassController.isLoadingDetail.value) {
            return const SkeletonKelasPrivate();
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   height: 80,
                        //   width: 80,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(4),
                        //       color: Colors.black,
                        //       image: DecorationImage(
                        //           image: AssetImage("images/matematika.png"),
                        //           fit: BoxFit.cover)),
                        // ),
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.network(
                            _privateClassController.detail.value.mentor?.photo ?? defaultImage, // Replace with your image URL
                            width: 80, // Adjust the width as needed
                            height: 80, // Adjust the height as needed
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Text('Failed to load image');
                            },
                          ),
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
                                      "${_privateClassController.detail.value.mentor?.fullName}",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${_privateClassController.detail.value.subject?.name}",
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
                            "Keterangan",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 10),
                          Html(
                            data:
                                "${_privateClassController.detail.value.description}",
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
                                    "${_privateClassController.detail.value.grade?.name}",
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
                                    "Kelas ${_privateClassController.detail.value.learningMethod?.name}",
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
                      Container(
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
                                "${_privateClassController.detail.value.address}",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff11578A))),
                              ),
                            ],
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
                      final toMap = PrivateClass()
                          .toCheckout(_privateClassController.detail.value);
                      Get.to(CheckoutPage(
                        checkoutParams: toMap,
                        typeId: 1,
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
        ));
  }
}

class SkeletonDetailKelasPrivate extends StatelessWidget {
  const SkeletonDetailKelasPrivate({super.key});

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
