import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/homeScreen/homescreen.dart';

class WaitingPay extends StatefulWidget {
  const WaitingPay({super.key});

  @override
  State<WaitingPay> createState() => _WaitingPayState();
}

class _WaitingPayState extends State<WaitingPay> {
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
                          "Bank Mandiri",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.white),
                        ),
                        // Status Menunggu
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //       color: Colors.blue,
                        //       borderRadius: BorderRadius.circular(4)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text("Menunggu",
                        //         style: GoogleFonts.inter(
                        //             fontSize: 14, color: Colors.white)),
                        //   ),
                        // ),
                        //Status Gagal
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xffFF0000),
                        //       borderRadius: BorderRadius.circular(4)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text("Gagal",
                        //         style: GoogleFonts.inter(
                        //             fontSize: 14, color: Colors.white)),
                        //   ),
                        // ),
                        //Status Berhasil
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff8BC523),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Berhasil",
                                style: GoogleFonts.inter(
                                    fontSize: 14, color: Colors.white)),
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
                ElevatedButton(
                    onPressed: () => Get.to(BottomBar()),
                    child: Text("Kembali ke Homepage",
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
