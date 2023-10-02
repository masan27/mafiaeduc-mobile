import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/sales_controller.dart';

class RincianPembayaran extends StatefulWidget {
  final String salesId;
  final bool showHomeButton;
  const RincianPembayaran(
      {super.key, required this.salesId, required this.showHomeButton});

  @override
  State<RincianPembayaran> createState() => _RincianPembayaranState();
}

class _RincianPembayaranState extends State<RincianPembayaran> {
  final SalesController _salesController = Get.put(SalesController());
  final TextEditingController _commentInput = TextEditingController();
  final Rx<double> _ratingInput = 0.0.obs;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    _commentInput.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    // Simulate an asynchronous task, such as fetching data from an API
    await _salesController.getSales(widget.salesId).catchError((e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title: FlashController().setProperError(e.toString()));
      Get.off(const BottomBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightApp = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      automaticallyImplyLeading: false,
      leading: widget.showHomeButton ? null : BackButton(color: Colors.black),
      title: Text(
        "Rincian Pembayaran",
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );

    final heightBody = heightApp - appBar.preferredSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE)),
                    borderRadius: BorderRadius.circular(8)),
                child: Obx(() {
                  if (_salesController.loading.value) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 150,
                        child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center vertically
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 10),
                                  Text("Memuat Data",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black))
                                ],
                              )
                            ]),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: _salesController
                                              .sales.value.salesDate ==
                                          null
                                      ? "-"
                                      : DateFormat('d MMM y • HH:mm', 'id_ID')
                                          .format(_salesController
                                              .sales.value.salesDate!),
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff9A9A9A))),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      "${_salesController.sales.value.status!.name}",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: setColor(_salesController
                                              .sales.value.status!.id))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            child: Container(
                              height: 1,
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${_salesController.sales.value.product!.title}",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xff11578A),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Pembayaran",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                  Text(
                                    _salesController.sales.value.totalPrice ==
                                            null
                                        ? "-"
                                        : NumberFormat.currency(
                                                locale: 'id_ID',
                                                symbol: 'Rp',
                                                decimalDigits: 0)
                                            .format(int.parse(_salesController
                                                .sales.value.totalPrice
                                                .toString())),
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Harga",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              ),
                              Text(
                                _salesController.sales.value.product?.price ==
                                        null
                                    ? "-"
                                    : NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(int.parse(_salesController
                                            .sales.value.product!.price
                                            .toString())),
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya platform",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              ),
                              Text(
                                _salesController
                                            .sales.value.paymentMethod?.fee ==
                                        null
                                    ? "-"
                                    : NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(int.parse(_salesController
                                            .sales.value.paymentMethod!.fee
                                            .toString())),
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Metode pembayaran",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              ),
                              Text(
                                "Transfer ${_salesController.sales.value.paymentMethod!.description}",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order ID",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              ),
                              Text(
                                "${_salesController.sales.value.id}",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: Text(
                              "Jangan lupa untuk memberikan ulasan transaksi sudah terbayarkan ",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Color(0xff9A9A9A)),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
              ),
            ),
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
              Visibility(
                visible: widget.showHomeButton,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(const BottomBar()),
                    child: Text("Kembali ke Homepage",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(double.infinity, 55),
                        elevation: 0,
                        shadowColor: Colors.white,
                        backgroundColor: Color(0xff8BC523))),
              ),
              Visibility(
                visible: !widget.showHomeButton,
                child: Obx(
                  () => ElevatedButton(
                      onPressed: _salesController.sales.value.status?.id == 3 && (_salesController.sales.value.feedback != null && _salesController.sales.value.feedback == 0)
                          ? () {
                              if (_salesController.sales.value.feedback != null && _salesController.sales.value.feedback == 1) {
                                return;
                              } else {
                                showDialogRating(context, heightBody);
                              }
                            }
                          : null,
                      child: Text(
                          _salesController.sales.value.feedback == 0
                              ? "Beri Ulasan"
                              : "Sudah Memberikan Ulasan",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 55),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color(0xff8BC523))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogRating(BuildContext context, double heightBody) {
    Get.defaultDialog(
        title: "Beri Ulasan",
        content: Center(
          child: Container(
            height: heightBody * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  glow: false,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    _ratingInput.value = rating;
                  },
                ),
                TextField(
                  controller: _commentInput,
                  maxLines: null,
                  minLines: 5,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Masukan Komentar",
                    hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff9A9A9A))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Color(0xff9a9a9a))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Color(0xff9a9a9a))),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Batal",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_ratingInput.value < 1) {
                    FlashController().flashMessage(FlashMessageType.warning,
                        title: "Rating wajib dipilih");
                  } else if (_commentInput.text == "") {
                    FlashController().flashMessage(FlashMessageType.warning,
                        title: "Komentar wajib diisi");
                  } else {
                    Get.dialog(Center(child: CircularProgressIndicator()),
                        barrierDismissible: false);
                    _salesController.setReview({
                      "sales_id": _salesController.sales.value.id,
                      "rating": _ratingInput.value,
                      "comment": _commentInput.text
                    }).then((value) {
                      Get.back();
                      Get.back();
                      _fetchData();
                      FlashController().flashMessage(FlashMessageType.success,
                          title: "Berhasil memberikan review");
                    }).catchError((e) {
                      Get.back();
                      FlashController().flashMessage(FlashMessageType.error,
                          title: FlashController().setProperError(e.toString()));
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Kirim",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[600]),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
        barrierDismissible: false);
  }

  Color setColor(int status) {
    if (status == 1) {
      return Colors.indigoAccent;
    } else if (status == 2) {
      return Colors.orange;
    } else if (status == 3) {
      return Color(0xff8BC523);
    } else {
      return Color(0xffFF0000);
    }
  }
}
