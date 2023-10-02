import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/controllers/notification_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mafiaeducation/controllers/grade_controller.dart';
import 'package:mafiaeducation/controllers/learning_material_controller.dart';
import 'package:mafiaeducation/controllers/learning_type_controller.dart';
import 'package:mafiaeducation/materi/detailmateri.dart';
import 'package:easy_debounce/easy_debounce.dart';

class ItemMateri extends StatefulWidget {
  const ItemMateri({super.key});

  @override
  State<ItemMateri> createState() => _ItemMateriState();
}

class _ItemMateriState extends State<ItemMateri> {
  final GradeController _gradeController = Get.put(GradeController());
  final LearningTypeController _learningTypeController =
      Get.put(LearningTypeController());
  final LearningMaterialController _learningMaterialController =
      Get.put(LearningMaterialController());
  final NotificationController _notificationController =
      Get.put(NotificationController());

  final TextEditingController searchInput = TextEditingController();
  String? selectedValueJenjang;
  String? selectedValueTipe;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _learningMaterialController.getLearningMaterials({
      "grade": selectedValueJenjang ?? "",
      "learning_method": selectedValueTipe ?? "",
      "search": searchInput.text,
    });
  }

  void _searchData() {
    EasyDebounce.debounce('search', Duration(milliseconds: 800), () {
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightApp = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      leading: BackButton(color: Colors.black),
      title: Text(
        "Materi",
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
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        child: StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
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
                                          "Jenjang pendidikan",
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
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedValueJenjang,
                                              isExpanded: true,
                                              hint: Text(
                                                'Pilih jenjang pendidikan',
                                                style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff9a9a9a))),
                                              ),
                                              icon: SvgPicture.asset(
                                                  "images/arrow-down.svg"),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedValueJenjang =
                                                      newValue;
                                                });
                                              },
                                              items: _gradeController.grades
                                                  .map<
                                                      DropdownMenuItem<
                                                          String>>((item) {
                                                return DropdownMenuItem<String>(
                                                  value: item.id.toString(),
                                                  child: Text(
                                                    item.name.toString(),
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Tipe Pembelajaran",
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
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedValueTipe,
                                              isExpanded: true,
                                              hint: Text(
                                                'Pilih tipe pembelajaran',
                                                style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff9a9a9a))),
                                              ),
                                              icon: SvgPicture.asset(
                                                  "images/arrow-down.svg"),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedValueTipe = newValue;
                                                });
                                              },
                                              items: _learningTypeController
                                                  .learningTypes
                                                  .map<
                                                      DropdownMenuItem<
                                                          String>>((item) {
                                                return DropdownMenuItem<String>(
                                                  value: item.id.toString(),
                                                  child: Text(
                                                    item.name.toString(),
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                          onPressed: () {
                                            _searchData();
                                          },
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
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        }),
                      ));
            },
          ),
        ),
      ],
    );

    final heightBody = heightApp - appBar.preferredSize.height;
    return WillPopScope(
        onWillPop: () async {
          // Tambahkan kode yang ingin dijalankan sebelum keluar dari layar
          // Ini akan dipanggil saat pengguna menekan tombol "Back"
          await _notificationController.getDotsNotification();
          return true; // Kembalikan true jika Anda ingin keluar dari layar
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Column(
            children: [
              Container(
                height: heightBody * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    controller: searchInput,
                    onChanged: (value) => _searchData(),
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Cari layanan, pelajaran, & tujuan",
                        hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color(0xff9a9a9a)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xff9a9a9a), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xff9A9A9A), width: 1)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SvgPicture.asset(
                            "images/search.svg",
                            width: 24,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Obx(() {
                if (_learningMaterialController.isLoading.value) {
                  return const SkeletonMateri();
                } else {
                  if (_learningMaterialController.list.isEmpty) {
                    return Center(
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Tidak ada data",
                            style: TextStyle(fontSize: 20),
                          )),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        height: heightBody * 0.9,
                        child: ListView.builder(
                          itemCount: _learningMaterialController.list.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item =
                                _learningMaterialController.list[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xffEEEEEE)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  item.title ?? '-',
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black)),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.grade?.name ?? '-',
                                                  style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black)),
                                                ),
                                              ),
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
                                                  RichText(
                                                      text: TextSpan(
                                                    text: 'Hanya ',
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black)),
                                                    // children: <TextSpan>[
                                                    //   TextSpan(
                                                    //     text: NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(int.parse(item.price.toString() ?? '0')),
                                                    //     style: GoogleFonts.inter(
                                                    //         textStyle: TextStyle(
                                                    //             fontSize: 12,
                                                    //             fontWeight:
                                                    //                 FontWeight.normal,
                                                    //             color: Colors.red,
                                                    //             decoration: TextDecoration
                                                    //                 .lineThrough)),
                                                    //   ),
                                                    // ],
                                                  )),
                                                  Text(
                                                    NumberFormat.currency(
                                                            locale: 'id_ID',
                                                            symbol: 'Rp',
                                                            decimalDigits: 0)
                                                        .format(int.parse(item
                                                            .price
                                                            .toString())),
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.to(DetailItemMateri(
                                                        id: item.id ?? 0));
                                                  },
                                                  child: Text("Lihat Materi",
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12)),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          // shape: StadiumBorder(),
                                                          maximumSize: Size(
                                                              double.infinity,
                                                              50),
                                                          elevation: 0,
                                                          shadowColor:
                                                              Colors.white,
                                                          backgroundColor:
                                                              Color(
                                                                  0xff8BC523))),
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
                          },
                        ),
                      ),
                    );
                  }
                }
              }),
            ],
          ),
        ));
  }
}

class SkeletonMateri extends StatelessWidget {
  const SkeletonMateri({super.key});

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
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            borderRadius: BorderRadius.circular(8)),
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
                                      width: MediaQuery.of(context).size.width -
                                          250,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          250,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 50,
                                      height: 10.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          330,
                                      height: 30.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                  ]))
                            ],
                          ),
                        ),
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
