import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Auth/login.dart';
import 'package:mafiaeducation/controllers/mentor_controller.dart';
import 'package:mafiaeducation/controllers/notification_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';
import 'package:mafiaeducation/daftarmentor/registmentor.dart';
import 'package:mafiaeducation/kelasbelajar/kelasbelajar.dart';
import 'package:mafiaeducation/kelasprivate/kelasprivate.dart';
import 'package:mafiaeducation/materi/materi.dart';
import 'package:mafiaeducation/models/subject_model.dart';
import 'package:mafiaeducation/notifikasi/notifikasi.dart';
// import 'package:mafiaeducation/shimmer/detail_shimmer.dart';
// import 'package:mafiaeducation/shimmer/test_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController _userController = Get.find();
  final NotificationController _notificationController =
      Get.put(NotificationController());
  final MentorController _mentorController = Get.put(MentorController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _notificationController.getDotsNotification();
    if (!_userController.userExists.value) {
      await _userController.getUser();
    }
    await _mentorController.getCanRegist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Obx(
              () => Text(
                _userController.userExists.value
                    ? 'Hi, ${_userController.user.value.fullName}'
                    : 'Hi,',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (_userController.userExists.value) {
                        Get.to(const NotificationPage());
                      } else {
                        QuickAlert.loginFirst(context);
                      }
                    },
                    child: Obx(() => Icon(
                          _notificationController.dots.value
                              ? Icons.notification_important_outlined
                              : Icons.notifications_outlined,
                          color: _notificationController.dots.value
                              ? Colors.red
                              : Colors.black,
                        )),
                  ),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (_userController.userExists.value) {
                        Get.to(const KelasBelajar());
                      } else {
                        QuickAlert.loginFirst(context);
                      }
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item1.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Kelas Belajar",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_userController.userExists.value) {
                        Get.to(const KelasPrivate());
                      } else {
                        QuickAlert.loginFirst(context);
                      }
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item2.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Kelas Private",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_userController.userExists.value) {
                        Get.to(const ItemMateri());
                      } else {
                        QuickAlert.loginFirst(context);
                      }
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item3.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Materi",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_userController.userExists.value) {
                        if (_mentorController.canRegist.value) {
                          Get.to(const RegistMentor());
                        } else {
                          QuickMentor.pendingStatus(context);
                        }
                      } else {
                        QuickAlert.loginFirst(context);
                      }
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("images/item4.svg", width: 60),
                        SizedBox(height: 10),
                        Text(
                          "Daftar Mentor",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            RecomMentors(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Telah dibuka!",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(height: 2),
                  Text("Pendaftaran mentor Mafia Education Kenanga",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0xff9a9a9a)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xff11578A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/mentor.png", width: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Registrasi Mentor",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white)),
                          Text("Bergabung bersama Mafia Education!",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.white)),
                          SizedBox(height: 15),
                          SizedBox(width: 50),
                          Row(
                            children: [
                              Text("GRATIS!",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white)),
                              SizedBox(width: 30),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_userController.userExists.value) {
                                      if (_mentorController.canRegist.value) {
                                        Get.to(const RegistMentor());
                                      } else {
                                        QuickMentor.pendingStatus(context);
                                      }
                                    } else {
                                      QuickAlert.loginFirst(context);
                                    }
                                  },
                                  child: Text("Bergabung",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      maximumSize: Size(double.infinity, 50),
                                      elevation: 0,
                                      shadowColor: Colors.white,
                                      backgroundColor: Color(0xff8BC523))),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Container(
            //     child: ElevatedButton(
            //   child: Text("shimmer list"),
            //   onPressed: () {
            //     Get.to(TestShimmer());
            //   },
            // )),
            //  Container(
            //     child: ElevatedButton(
            //   child: Text("shimmer detail"),
            //   onPressed: () {
            //     Get.to(DetailShimmer());
            //   },
            // ))
          ],
        ),
      ),
    );
  }
}

class RecomMentors extends StatefulWidget {
  const RecomMentors({
    super.key,
  });

  @override
  State<RecomMentors> createState() => _RecomMentorsState();
}

class _RecomMentorsState extends State<RecomMentors> {
  final MentorController _mentorController = Get.find();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _mentorController.getRecommendMentors();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: (_mentorController.mentors.isNotEmpty ||
                _mentorController.isLoading.value)
            ? true
            : false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi Mentor",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2),
                      Text("Mentor dengan rating terbaik",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0xff9a9a9a)))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              child: Container(child: Obx(() {
                if (_mentorController.isLoading.value) {
                  return ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          SizedBox(width: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                                child: Card(
                              child: Container(
                                  width: 250,
                                  height: 275,
                                  child: Shimmer.fromColors(
                                    baseColor: Color.fromRGBO(122, 118, 118, 1),
                                    highlightColor:
                                        Color.fromRGBO(255, 255, 255, 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: 20,
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 2),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 25),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.27,
                                                      height: 15,
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            "images/medal.svg",
                                                            width: 25),
                                                        SizedBox(width: 5),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                          height: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _mentorController.mentors.length,
                    itemBuilder: (context, index) {
                      final item = _mentorController.mentors[index];
                      String subjectText = '';
                      List<Subject> subjects = item.subjects ?? [];
                      if (subjects.isNotEmpty) {
                        for (var subject in subjects) {
                          if (subjectText == '') {
                            subjectText += subject.name.toString();
                          } else {
                            subjectText += ", ${subject.name}";
                          }
                        }
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                            child: Card(
                          child: Container(
                            width: 250,
                            height: 275,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Container(
                                  width: 250,
                                  height: 150,
                                  child: Image.network("${item.photo}",
                                      fit: BoxFit.fitHeight),
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item.fullName}",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "$subjectText",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Color(0xff9a9a9a)),
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${item.address}",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "images/medal.svg",
                                                  width: 25),
                                              SizedBox(width: 5),
                                              Text(
                                                "${item.rating}",
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        )),
                      );
                    },
                  );
                }
              })),
            ),
            SizedBox(height: 32),
          ],
        )));
  }
}

class QuickAlert {
  static void loginFirst(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Maaf'),
            content: Text('Harap login terlebih dahulu'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Nanti aja'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.to(LoginPage());
                },
                child: Text('Login'),
              ),
            ],
          );
        });
  }
}

class QuickMentor {
  static void pendingStatus(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Harap bersabar'),
            content: Text('Pengajuan mentor anda sedang kami proses'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Oke'),
              ),
            ],
          );
        });
  }
}
