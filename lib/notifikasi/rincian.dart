import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RincianPembayaran extends StatefulWidget {
  const RincianPembayaran({super.key});

  @override
  State<RincianPembayaran> createState() => _RincianPembayaranState();
}

class _RincianPembayaranState extends State<RincianPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
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
      ),
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "1 Jun 2023 • 07:51",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff9A9A9A))),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Transaksi Berhasil",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff8BC523))),
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
                        "Pembelian Paket Mafia IPA",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Payment",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ),
                              Text(
                                "Rp.800.000",
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
                            "Rp.800.000",
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
                            "Rp.25.000",
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
                            "Transfer Bank (BCA)",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
