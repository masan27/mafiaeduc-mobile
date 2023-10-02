import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/schedule_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailJadwal extends StatefulWidget {
  const DetailJadwal({super.key});

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  final ScheduleController _c = Get.put(ScheduleController());

  final String defaultImage =
      'https://w7.pngwing.com/pngs/260/984/png-transparent-classroom-comanche-springs-elementary-classroom-with-green-board-and-desks-brown-desks-with-blackboard-illustration-furniture-class-rectangle.png';

  void openURL(String url, String platform) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      String err;
      if (platform == 'Lainnya') {
        err =
            "Aplikasi untuk stream belum di install, silahkan install terlebih dahulu";
      } else {
        err =
            "Aplikasi $platform belum di install, silahkan install terlebih dahulu";
      }
      FlashController().flashMessage(FlashMessageType.info, title: err);
      print('Error launching because: $e');
    }
  }

  String convertToInternationalFormat(String phoneNumber) {
    // Check if the phone number starts with '0'
    if (phoneNumber.startsWith('0')) {
      // Remove the leading '0' and prepend '+62'
      return '+62${phoneNumber.substring(1)}';
    }
    // If it doesn't start with '0', assume it's already in international format
    return phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            _c.detail.value.groupClassesId != null
                ? "Kelas Belajar"
                : "Kelas Private",
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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Column(children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 60,
                  //   height: 60,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: Image(image: AssetImage("images/matematika.png")),
                  //   ),
                  // ),
                  Obx(() {
                    if (_c.detail.value.privateClassesId != null) {
                      return Container(
                        height: 60,
                        width: 60,
                        child: Image.network(
                          _c.detail.value.mentor!.photo != null
                              ? '${_c.detail.value.mentor?.photo}'
                              : defaultImage, // Replace with your image URL
                          width: 60, // Adjust the width as needed
                          height: 60, // Adjust the height as needed
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Text('Failed to load image');
                          },
                        ),
                      );
                    } else {
                      return Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("images/matematika.png"),
                                fit: BoxFit.cover)),
                      );
                    }
                  }),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _c.detail.value.groupClassesId != null
                            ? _c.detail.value.groupClass!.title.toString()
                            : _c.detail.value.mentor!.fullName.toString(),
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${_c.detail.value.subject!.name}",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff11578A))),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffEEEEEE)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("images/school.svg",
                                      width: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    "${_c.detail.value.grade!.name}",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff11578A))),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("images/groups.svg",
                                      width: 25),
                                  SizedBox(width: 10),
                                  Text(
                                    "Kelas ${_c.detail.value.learningMethod!.name}",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xff11578A))),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
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
                          Text(
                            "Deskripsi",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 10),
                          Html(
                            data: _c.detail.value.groupClassesId != null
                                ? _c.detail.value.groupClass!.description
                                : _c.detail.value.privateClass!.description,
                            // style: GoogleFonts.inter(
                            //     textStyle: TextStyle(
                            //         fontWeight: FontWeight.normal,
                            //         color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
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
                            children: [
                              Obx(() {
                                if (_c.detail.value.meetingPlatform == 'Zoom') {
                                  return SvgPicture.asset("images/zoomlogo.svg",
                                      width: 60);
                                } else if (_c.detail.value.meetingPlatform ==
                                    'Google Meet') {
                                  return SvgPicture.asset(
                                      "images/gmeetlogo.svg",
                                      height: 35);
                                } else if (_c.detail.value.meetingPlatform ==
                                    'Microsoft Teams') {
                                  return SvgPicture.asset(
                                      "images/teamslogo.svg",
                                      height: 35);
                                } else if (_c.detail.value.meetingPlatform ==
                                    'Skype') {
                                  return SvgPicture.asset(
                                      "images/skypelogo.svg",
                                      height: 35);
                                } else if (_c.detail.value.meetingPlatform ==
                                    'Discord') {
                                  return SvgPicture.asset(
                                      "images/discordlogo.svg",
                                      height: 35);
                                } else {
                                  return SvgPicture.asset(
                                      "images/othermeetlogo.svg",
                                      height: 35);
                                }
                              })
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Link : ",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ),
                          InkWell(
                              onTap: (() {
                                openURL(_c.detail.value.meetingLink.toString(),
                                    _c.detail.value.meetingPlatform.toString());
                              }),
                              child: Text(
                                _c.detail.value.meetingLink.toString(),
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff11578A))),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: false,
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
                              children: [
                                SvgPicture.asset("images/icons8-whatsapp.svg",
                                    width: 40),
                                SizedBox(width: 10),
                                Text(
                                  "+(62) 0813 1234 5678",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff11578A))),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: _c.detail.value.address != null ? true : false,
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
                            Text(
                              "Alamat : ",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            Text(
                              "${_c.detail.value.address}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff11578A))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Container(
            height: 150,
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(children: [
                  Text(
                    "Butuh bantuan?\nSilahkan hubungi via WhatsApp di bawah ini!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff9A9A9A))),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        openURL(
                            "https://wa.me/${convertToInternationalFormat(_c.detail.value.mentor!.phone.toString())}",
                            "WhatsApp");
                      },
                      child: Text("Chat Via WhatsApp",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 55),
                          elevation: 0,
                          shadowColor: Colors.white,
                          backgroundColor: Color(0xff8BC523))),
                ]))));
  }
}
