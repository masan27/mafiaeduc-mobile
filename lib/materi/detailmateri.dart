import 'package:mafiaeducation/checkout/checkout.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/models/learning_material_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/controllers/learning_material_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailItemMateri extends StatefulWidget {
  final int id;
  const DetailItemMateri({super.key, required this.id});

  @override
  State<DetailItemMateri> createState() => _DetailItemMateriState();
}

class _DetailItemMateriState extends State<DetailItemMateri> {
  final LearningMaterialController _learningMaterialController =
      Get.put(LearningMaterialController());

  Future<void> openPdf(String pdfUrl) async {
     try {
      await launchUrl(Uri.parse(pdfUrl));
    } catch (e) {
      FlashController().flashMessage(FlashMessageType.warning,
          title: 'Tidak menemukan aplikasi yang mendukung buka PDF');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _learningMaterialController
        .getDetailLeariningMaterials(widget.id)
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
    return WillPopScope(
        onWillPop: () async {
          // Tambahkan kode yang ingin dijalankan sebelum keluar dari layar
          // Ini akan dipanggil saat pengguna menekan tombol "Back"
          await _learningMaterialController.getLearningMaterials({});
          return true; // Kembalikan true jika Anda ingin keluar dari layar
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: BackButton(color: Colors.black),
              title: Text(
                "Detail Materi",
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
              child: Obx(() {
                if (_learningMaterialController.isLoadingDetail.value) {
                  return const SkeletonDetailMateri();
                } else {
                  return Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Column(
                        children: [
                          Container(
                            // height: 150,
                            width: double.infinity,
                            // color: Colors.orange,
                            child: Row(children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  _learningMaterialController
                                          .detail.value.coverImage ??
                                      defaultImage, // Replace with your image URL
                                  width: 100, // Adjust the width as needed
                                  height: 100, // Adjust the height as needed
                                  fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Text('Failed to load image');
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                // height: 10 0,
                                width: MediaQuery.of(context).size.width -
                                    150, // Atur lebar maksimal
                                // color: Colors.green,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_learningMaterialController.detail.value.title}",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff11578A))),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${_learningMaterialController.detail.value.grade?.name}",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "${_learningMaterialController.detail.value.author}",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff9a9a9a))),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${_learningMaterialController.detail.value.totalPages} Halaman",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xff9a9a9a))),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Row(
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
                                        // children: <TextSpan>[
                                        //   TextSpan(
                                        //     text: 'Rp.75.000',
                                        //     style: GoogleFonts.inter(
                                        //         textStyle: TextStyle(
                                        //             fontSize: 12,
                                        //             fontWeight: FontWeight.normal,
                                        //             color: Colors.red,
                                        //             decoration:
                                        //                 TextDecoration.lineThrough)),
                                        //   ),
                                        // ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _learningMaterialController
                                                  .detail.value.price ==
                                              null
                                          ? "-"
                                          : NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp',
                                                  decimalDigits: 0)
                                              .format(int.parse(
                                                  _learningMaterialController
                                                      .detail.value.price
                                                      .toString())),
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () => openPdf(
                                        _learningMaterialController.detail.value.sourceFile.toString()),
                                    child: Text("Preview Materi",
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
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 1,
                      child: Container(
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(height: 30),
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
                                    data:
                                        "${_learningMaterialController.detail.value.description}",
                                    // style: GoogleFonts.inter(
                                    //     textStyle: TextStyle(
                                    //         fontWeight: FontWeight.normal,
                                    //         color: Colors.black)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
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
                                    "Keuntungan yang didapat",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                  ),
                                  SizedBox(height: 10),
                                  Html(
                                    data:
                                        "${_learningMaterialController.detail.value.benefits}",
                                    // style: GoogleFonts.inter(
                                    //     textStyle: TextStyle(
                                    //         fontWeight: FontWeight.normal,
                                    //         color: Colors.black)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ]);
                }
              }),
            ),
            bottomNavigationBar: Container(
              height: 100,
              // color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          final toMap = LearningMaterial().toCheckout(
                              _learningMaterialController.detail.value);
                          Get.to(CheckoutPage(
                            checkoutParams: toMap,
                            typeId: 3,
                          ));
                        },
                        child: Text("Beli Sekarang",
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
            )));
  }
}

class SkeletonDetailMateri extends StatelessWidget {
  const SkeletonDetailMateri({super.key});

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
                          SizedBox(height: 8),
                          Container(
                            width: MediaQuery.of(context).size.width - 250,
                            height: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 10.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 70,
                            height: 15.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 70,
                            height: 15.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 15.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 170,
                            height: 30.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.only(top: 15),
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
