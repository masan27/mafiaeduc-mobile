import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/checkout/halaman2.dart';

class Checkout1 extends StatefulWidget {
  const Checkout1({super.key});

  @override
  State<Checkout1> createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {
  String selectedMethod = "Metode pembayaran";

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
                Row(
                  children: [
                    Image(image: AssetImage("images/mandiri.png")),
                    SizedBox(width: 10),
                    _buildPaymentMethod("Transfer Bank Mandiri"),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image(image: AssetImage("images/bni.png")),
                    SizedBox(width: 10),
                    _buildPaymentMethod("Bank BNI"),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image(image: AssetImage("images/bni.png")),
                    SizedBox(width: 10),
                    _buildPaymentMethod("Bank BRI"),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String methodName) {
    return InkWell(
        onTap: () {
          setState(() {
            selectedMethod = methodName;
          });
          Navigator.pop(
              context); // Tutup bottom sheet setelah memilih metode pembayaran
        },
        child: Column(
          children: [
            Text(
              methodName,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            )
          ],
        ));
  }

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
                                "Paket Mafia IPA",
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
                              "1 Jun 2023 07:51 PM",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Color(0xff9a9a9a)),
                            ),
                            SizedBox(width: 60),
                            Text(
                              "SMA IPA • Paket A",
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
                              "Online",
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
                              "Rp.800.000",
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
                              "Rp.25.000",
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
                              "Rp.25.000",
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
                          "Rp.825.000",
                          style: GoogleFonts.inter(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () => Get.to(Checkout2()),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize: Size(160, 60),
                            primary: Color(0xff8BC523),
                            elevation: 0,
                            shadowColor: Colors.white),
                        child: Text("Bayar",
                            style: GoogleFonts.inter(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
