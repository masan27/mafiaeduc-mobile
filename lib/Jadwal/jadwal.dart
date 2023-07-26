import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Jadwal",
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset("images/filter.svg"),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/materiku.svg', width: 240),
              SizedBox(height: 20),
              Text("Oopps! Sayang sekali",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(height: 10),
              Text(
                "Kamu belum memiliki materi.\nSilahkan beli materi terlebih dahulu.",
                style:
                    GoogleFonts.inter(fontSize: 14, color: Color(0xff9A9A9A)),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
