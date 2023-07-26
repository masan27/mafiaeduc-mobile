import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1Mentor extends StatefulWidget {
  const Page1Mentor({super.key});

  @override
  State<Page1Mentor> createState() => _Page1MentorState();
}

class _Page1MentorState extends State<Page1Mentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Daftar Mentor",
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
            child: SvgPicture.asset("images/help.svg"),
          )
        ],
      ),
    );
  }
}
