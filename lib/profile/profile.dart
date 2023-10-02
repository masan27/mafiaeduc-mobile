import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/controllers/auth_controller.dart';
import 'package:mafiaeducation/controllers/contract_controller.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/lupapass/page1.dart';
import 'package:mafiaeducation/profile/akunsaya.dart';
import 'package:mafiaeducation/profile/lengkapidata.dart';
import 'package:mafiaeducation/profile/telepon.dart';
import 'package:url_launcher/url_launcher.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final UserController userController = Get.find();
  final ContactController _contactController = Get.put(ContactController());

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

  Future<void> _fetchData() async {
    await _contactController.getContacts();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: BackButton(color: Colors.black),
        title: Text(
          "Profile",
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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Visibility(
                      visible: false,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              Image(image: AssetImage("images/matematika.png")),
                        ),
                      ),
                    ),
                    // SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              "${userController.user.value.fullName ?? '-'}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            )),
                        SizedBox(height: 5),
                        Obx(() => Text(
                              "${userController.user.value.phone ?? '-'}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff9A9A9A))),
                            )),
                        SizedBox(height: 5),
                        Obx(() => Text(
                              "${userController.user.value.email ?? '-'}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                height: 1,
                child: Container(
                  color: Color(0xffeeeeee),
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("images/general.svg", width: 30),
                      SizedBox(width: 10),
                      Text(
                        "General",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(AkunSaya()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Akun Saya",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(LengkapiData()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lengkapi Data",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("images/security-safe.svg", width: 30),
                      SizedBox(width: 10),
                      Text(
                        "Keamanan",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(Telepon()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nomor Handphone",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(const LupaPass1(slug: 'profile')),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ubah Kata Sandi",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("images/information.svg", width: 30),
                      SizedBox(width: 10),
                      Text(
                        "Pusat Bantuan",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_contactController.list.isEmpty) {
                      return;
                    } else {
                      openURL(
                          "https://wa.me/${convertToInternationalFormat(_contactController.list[0].phone.toString())}",
                          "WhatsApp");
                    }
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hubungi Kami",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ),
                            SvgPicture.asset("images/arrow-right.svg")
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1,
                          child: Container(
                            color: Color(0xffeeeeee),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: ElevatedButton(
                  onPressed: () => AuthController().logout(),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(double.infinity, 50),
                      primary: Color(0xff8BC523),
                      elevation: 0,
                      shadowColor: Colors.white),
                  child: Text("Keluar",
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w600))),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
