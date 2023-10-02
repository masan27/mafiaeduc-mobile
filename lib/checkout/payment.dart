import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/checkout/confimpayment.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/sales_controller.dart';
import 'package:shimmer/shimmer.dart';

class PaymentPage extends StatefulWidget {
  final String salesId;
  final bool showHomeButton;
  const PaymentPage(
      {super.key, required this.salesId, required this.showHomeButton});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

const String sop =
    "• Selesaikan pembayaran kamu dalam 1x24 jam\n• Tagihan ini akan otomatis gantikan tagihan Mandiri Virtual Account yang belum dibayar (jika ada)\n• Total Tagihan sudah termasuk Biaya Transaksi\n• Pastikan kamu bayar sesuai bank yang dipilih supaya transaksi kamu lancar";

class _PaymentPageState extends State<PaymentPage> {
  final SalesController _salesController = Get.put(SalesController());

  @override
  void initState() {
    super.initState();
    // You can initialize your state here

    _fetchData();
  }

  Future<void> _fetchData() async {
    // Simulate an asynchronous task, such as fetching data from an API
    await _salesController.getSales(widget.salesId).then((value) {
      setState(() {});
    }).catchError((e) {
      FlashController()
          .flashMessage(FlashMessageType.error, title: FlashController().setProperError(e.toString()));
      // Get.off(const BottomBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading:
              widget.showHomeButton ? null : BackButton(color: Colors.black),
          title: Text(
            "Rincian Pesanan",
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
            if (_salesController.sales.value.id == null) {
              return const SkeletonPayment();
            } else {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ID",
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.black),
                        ),
                        Text("${_salesController.sales.value.id}",
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff9a9a9a)))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Order Produk"),
                            SizedBox(height: 10),
                          ],
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "${_salesController.sales.value.product?.title}",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Color(0xff9a9a9a)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Image(image: AssetImage("images/mandiri.png")),
                            // SizedBox(width: 10),
                            Text(
                                "${_salesController.sales.value.paymentMethod?.description}"),
                            SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${_salesController.sales.value.paymentMethod?.accountNumber}",
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Batas Pembayaran"),
                            SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text(
                          _salesController.sales.value.expires == null
                              ? "-"
                              : DateFormat('dd/MM/yyyy', 'id_ID').format(
                                  _salesController.sales.value.expires!),
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.red[400]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Total Pembayaran"),
                            SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text(
                          _salesController.sales.value.totalPrice == null
                              ? "-"
                              : NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(int.parse(_salesController
                                      .sales.value.totalPrice
                                      .toString())),
                          style: GoogleFonts.inter(
                              fontSize: 28, color: Color(0xff8BC523)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      child: Text(
                        "$sop",
                        style: GoogleFonts.inter(
                            fontSize: 14, color: Colors.black),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
        ),
        bottomNavigationBar: Container(
          height: widget.showHomeButton ? 150 : 100,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Visibility(
                  visible: widget.showHomeButton,
                  child: ElevatedButton(
                      onPressed: () => Get.off(const BottomBar()),
                      child: Text("Kembali ke halaman utama",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 55),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 60, 61, 59))),
                ),
                SizedBox(height: 10),
                Opacity(
                  opacity: _salesController.sales.value.id == null ? 0.5 : 1.0,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_salesController.sales.value.id != null) {
                          Get.to(ConfirmPaymentPage(salesId: widget.salesId));
                        } else {
                          return;
                        }
                      },
                      child: Text("Konfirmasi Pembayaran",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 55),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color(0xff8BC523))),
                ),
              ],
            ),
          ),
        ));
  }
}

class SkeletonPayment extends StatelessWidget {
  const SkeletonPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromRGBO(122, 118, 118, 1),
        highlightColor: Color.fromRGBO(255, 255, 255, 1),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order ID",
                      style:
                          GoogleFonts.inter(fontSize: 14, color: Colors.black),
                    ),
                    Container(height: 30, width: 150, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Container(
                  height: 1,
                  color: Color(0xffeeeeee),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Order Produk"),
                        SizedBox(height: 10),
                      ],
                    ),
                    Container(height: 30, width: 150, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Container(
                  height: 1,
                  color: Color(0xffeeeeee),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Image(image: AssetImage("images/mandiri.png")),
                        // SizedBox(width: 10),
                        Container(height: 30, width: 150, color: Colors.white),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 10),
                    Container(height: 30, width: 150, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Container(
                  height: 1,
                  color: Color(0xffeeeeee),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Batas Pembayaran"),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 10),
                    Container(height: 30, width: 150, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Container(
                  height: 1,
                  color: Color(0xffeeeeee),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Total Pembayaran"),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 10),
                    Container(height: 30, width: 150, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Container(
                  height: 1,
                  color: Color(0xffeeeeee),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  child: Text(
                    "$sop",
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
