import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/homeScreen/homescreen.dart';

class ConfirmMentor extends StatefulWidget {
  const ConfirmMentor({super.key});

  @override
  State<ConfirmMentor> createState() => _ConfirmMentorState();
}

class _ConfirmMentorState extends State<ConfirmMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage("images/confirmmentor.png"),
                  width: 300,
                ),
              ),
              SizedBox(height: 30),
              Text("Pengajuan anda telah berhasil dikirim!",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                "Kamu akan dihubungi setelah pengajuan telah\nselesai diproses oleh tim kami dalam kurun waktu\n2 hari sejak pengajuan",
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
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
                ElevatedButton(
                    onPressed: () => Get.to(HomePage()),
                    child: Text("Kembali",
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
