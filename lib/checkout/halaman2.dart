import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/checkout/halaman3.dart';

class Checkout2 extends StatefulWidget {
  const Checkout2({super.key});

  @override
  State<Checkout2> createState() => _Checkout2State();
}

class _Checkout2State extends State<Checkout2> {
  // void _copyToClipboard(BuildContext context, String text) {
  //   Clipboard.setData(ClipboardData(text: text));
  //   Fluttertoast.showToast(
  //     msg: "Nomor rekening berhasil disalin!",
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.black54,
  //     textColor: Colors.white,
  //   );
  // }

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
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order ID",
                      style:
                          GoogleFonts.inter(fontSize: 14, color: Colors.black),
                    ),
                    Text("J4FK-IAS8-119D-D123",
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
                        Image(image: AssetImage("images/mandiri.png")),
                        SizedBox(width: 10),
                        Text("Transfer"),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(width: 10),
                    Text(
                      "10 600 1300 1891",
                      style:
                          GoogleFonts.inter(fontSize: 14, color: Colors.black),
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
                    "• Selesaikan pembayaran kamu dalam 1x24 jam\n• Tagihan ini akan otomatis gantikan tagihan Mandiri Virtual Account yang belum dibayar (jika ada)\n• Total Tagihan sudah termasuk Biaya Transaksi\n• Pastikan kamu bayar sesuai bank yang dipilih supaya transaksi kamu lancar",
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                  ),
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
                    onPressed: () => Get.to(checkout3()),
                    child: Text("Konfirmasi Pembayaran",
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
