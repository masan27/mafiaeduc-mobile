import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/notifikasi/rincian.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Notifikasi",
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
            InkWell(
              onTap: () => Get.to(RincianPembayaran()),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: "Transaksi Sukses!",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff8BC523))),
                                )),
                            RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                text: TextSpan(
                                  text: "14 Jul 2023",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff9A9A9A))),
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            text: TextSpan(
                              text: "Pembelian paket mafia IPA",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff9A9A9A))),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    child: Container(
                      height: 1,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "Menunggu Pembayaran",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff11578A))),
                              )),
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              text: TextSpan(
                                text: "14 Jul 2023",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          text: TextSpan(
                            text: "Pembelian paket mafia IPA",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff9A9A9A))),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Container(
                    height: 1,
                    color: Color(0xffEEEEEE),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "Transaksi Gagal",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFF0000))),
                              )),
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              text: TextSpan(
                                text: "14 Jul 2023",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff9A9A9A))),
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          text: TextSpan(
                            text: "Pembelian paket mafia IPA",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff9A9A9A))),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Container(
                    height: 1,
                    color: Color(0xffEEEEEE),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
