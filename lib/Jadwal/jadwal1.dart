import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafiaeducation/Jadwal/detailjadwal.dart';
import 'package:mafiaeducation/controllers/learning_type_controller.dart';
import 'package:mafiaeducation/controllers/schedule_controller.dart';
import 'package:shimmer/shimmer.dart';

class Jadwal1 extends StatefulWidget {
  const Jadwal1({super.key});

  @override
  State<Jadwal1> createState() => _Jadwal1State();
}

class _Jadwal1State extends State<Jadwal1> {
  final ScheduleController _scheduleController = Get.put(ScheduleController());
  final LearningTypeController _learningTypeController = Get.put(LearningTypeController());

  String? selectedValueTipe;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _scheduleController.getSchedules({
      "learning_method": selectedValueTipe ?? "",
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightApp = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      // leading: BackButton(color: Colors.black),
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
          child: InkWell(
            child: SvgPicture.asset("images/filter.svg"),
            onTap: (() {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
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
                                "Filter",
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
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Tipe pembelajaran",
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xff9a9a9a)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 15, left: 15),
                                          child: Obx(
                                            () => DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: selectedValueTipe,
                                                isExpanded: true,
                                                hint: Text(
                                                  'Pilih jenjang pendidikan',
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff9a9a9a))),
                                                ),
                                                icon: SvgPicture.asset(
                                                    "images/arrow-down.svg"),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueTipe =
                                                        newValue;
                                                  });
                                                },
                                                items: _learningTypeController.learningTypes
                                                    .map<
                                                        DropdownMenuItem<
                                                            String>>((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.id.toString(),
                                                    child: Text(
                                                      item.name.toString(),
                                                      style: GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          )),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                        onPressed: () => _fetchData(),
                                        child: Text("Filter",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18)),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            minimumSize:
                                                Size(double.infinity, 55),
                                            elevation: 0,
                                            shadowColor: Colors.white,
                                            backgroundColor:
                                                Color(0xff8BC523))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }));
            }),
          ),
        )
      ],
    );

    final heightBody = heightApp - appBar.preferredSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() {
              if (_scheduleController.isLoading.value) {
                return const SkeletonJadwal();
              } else {
                if (_scheduleController.list.isEmpty) {
                  return Center(
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Tidak ada data",
                          style: TextStyle(fontSize: 20),
                        )),
                  );
                } else {
                  return Container(
                    height: heightBody * 0.9,
                    child: ListView.builder(
                        itemCount: _scheduleController.list.length,
                        itemBuilder: (context, index) {
                          final item = _scheduleController.list[index];
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xffEEEEEE)),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.groupClassesId != null
                                                  ? "${item.groupClass?.title}"
                                                  : "${item.subject?.name}",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                            ),
                                            SvgPicture.asset(
                                                "images/${item.learningMethodId == '1' ? 'online.svg' : 'offline.svg'}")
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${item.grade?.name}",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black)),
                                                ),
                                                Text(
                                                  "${item.date} ${item.time}",
                                                  // "Senin, 19.00 - 20.00",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff7495A8))),
                                                ),
                                                Text(
                                                  "Mentor by ${item.mentor?.fullName}",
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff7495A8))),
                                                ),
                                              ],
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.dialog(
                                                    barrierDismissible: false,
                                                    Center(
                                                      child: CircularProgressIndicator(),
                                                    )
                                                  );
                                                  _scheduleController.getDetailSchedule(item).then((value) {
                                                    Get.back();
                                                    Get.to(const DetailJadwal());
                                                  });
                                                }
                                                    ,
                                                child: Text("Lihat Detail",
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12)),
                                                style: ElevatedButton.styleFrom(
                                                    // shape: StadiumBorder(),
                                                    maximumSize: Size(
                                                        double.infinity, 50),
                                                    elevation: 0,
                                                    shadowColor: Colors.white,
                                                    backgroundColor:
                                                        Color(0xff8BC523))),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        }),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}

class SkeletonJadwal extends StatelessWidget {
  const SkeletonJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Color.fromRGBO(122, 118, 118, 1),
                highlightColor: Color.fromRGBO(255, 255, 255, 1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 250,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 350,
                                  height: 15.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 300,
                                  height: 15.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 270,
                                  height: 15.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 50),
                                Container(
                                  width: 100,
                                  height: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                              ]))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
