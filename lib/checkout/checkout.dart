import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/controllers/checkout_controller.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/payment_method_controller.dart';

class CheckoutPage extends StatefulWidget {
  final Map<String, dynamic> checkoutParams;
  final int? typeId;
  const CheckoutPage({super.key, required this.checkoutParams, this.typeId});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutController _checkoutController = Get.put(CheckoutController());
  final PaymentMethodController _paymentMethodController =
      Get.put(PaymentMethodController());
  String selectedMethod = "Metode pembayaran";
  int? selectedMethodId;
  int? selectedFee;

  @override
  void initState() {
    super.initState();
    // You can initialize your state here
    fetchData();
  }

  Future<void> fetchData() async {
    await _checkoutController
        .setCurrent(widget.checkoutParams)
        .then((value) => setState(() {}));
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return _buildBottomSheetContent();
      },
    );
  }

  Widget _buildBottomSheetContent() {
    final paymentList = _paymentMethodController.paymentMethod;
    return Container(
      height: 330,
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
            "Metode Pembayaran",
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: paymentList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final paymentItem = paymentList[index];
                    return _buildPaymentMethod(paymentItem.id ?? 0,
                        "${paymentItem.description}", paymentItem.fee ?? 0);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(int methodId, String methodName, int fee) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
          onTap: () {
            setState(() {
              selectedMethod = methodName;
              selectedMethodId = methodId;
              selectedFee = fee;
            });
            Navigator.pop(
                context); // Tutup bottom sheet setelah memilih metode pembayaran
          },
          child: Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width - 70,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.5))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    methodName,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _checkoutController.checkout.value;
    final price = data.price;
    String priceString;
    if (price != null) {
      priceString =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
              .format(int.parse(data.price.toString()));
    } else {
      priceString = "-";
    }
    int totalPembayaran = (data.price ?? 0) + (selectedFee ?? 0);
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
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${data.title}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Paket",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat("dd MMM yyyy HH:mm", "id_ID")
                                  .format(DateTime.now()),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Color(0xff9a9a9a)),
                            ),
                            SizedBox(width: 60),
                            Text(
                              "${data.grade} ${data.subject ?? ""}",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Color(0xff11578A)),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Metode pembelajaran",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            ),
                            Text(
                              data.learningMethod ?? '-',
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          child: Container(
                            height: 1,
                            color: Color(0xff9A9A9A),
                          ),
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ringkasan Pembayaran",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Periksa kembali jumlah pembayaran pesanan kamu!",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            ),
                            Text(
                              "$priceString",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Biaya Platform",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            ),
                            Text(
                              selectedFee != null
                                  ? NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(int.parse(selectedFee.toString()))
                                  : "-",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          child: Container(
                            height: 1,
                            color: Color(0xff9A9A9A),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Pembayaran",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(
                                      int.parse(totalPembayaran.toString())),
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff11578A)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$selectedMethod",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: Text(
                            "Change",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total pembayaran",
                          style: GoogleFonts.inter(
                              fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'Rp',
                                  decimalDigits: 0)
                              .format(int.parse(totalPembayaran.toString())),
                          style: GoogleFonts.inter(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: _checkoutController.isCheckout.value
                            ? () {
                                if (selectedMethodId == null) {
                                  FlashController().flashMessage(
                                      FlashMessageType.warning,
                                      message:
                                          'Belum memilih metode pembayaran');
                                } else {
                                  Get.dialog(
                                      Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      barrierDismissible: false);
                                  _checkoutController.isCheckout.value = false;
                                  CheckoutController().store({
                                    "product_id": data.id,
                                    "payment_method_id": selectedMethodId,
                                    "type": widget.typeId
                                  }).catchError((e) {
                                    _checkoutController.isCheckout.value = true;
                                    Get.back();
                                    FlashController().flashMessage(
                                        FlashMessageType.error,
                                        title: FlashController()
                                            .setProperError(e.toString()));
                                  });
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(160, 60),
                            primary: Color(0xff8BC523),
                            elevation: 0,
                            shadowColor: Colors.white),
                        child: Text(
                          "Bayar",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
