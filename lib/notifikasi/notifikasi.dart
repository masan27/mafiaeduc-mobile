import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/checkout/payment.dart';
import 'package:mafiaeducation/checkout/rincian.dart';
import 'package:mafiaeducation/controllers/notification_controller.dart';
import 'package:shimmer/shimmer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationController _notificationController =
      Get.put(NotificationController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fecthData();
    _scrollController.addListener(_onScroll);
    _notificationController.resetNotification();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Sudah mencapai bagian bawah daftar
      // Muat lebih banyak data atau perbarui daftar di sini
      setState(() {
        if (!_notificationController.maxPage.value) {
          _notificationController.isScrollingLoading.value = true;
          Future.delayed(Duration(seconds: 1), () {
            _notificationController.currentPage.value += 1;
            _notificationController.getNotifications();
          });
        }
      });
    }
  }

  Future<void> _fecthData() async {
    if (_notificationController.currentPage.value != 1) {
      _notificationController.currentPage.value = 1;
    }
    await _notificationController.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Tambahkan kode yang ingin dijalankan sebelum keluar dari layar
          // Ini akan dipanggil saat pengguna menekan tombol "Back"
          await _notificationController.setRead();
          await _notificationController.getDotsNotification();
          return true; // Kembalikan true jika Anda ingin keluar dari layar
        },
        child: Scaffold(
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
          body: Column(children: [
            SizedBox(height: 20),
            Obx(
              () {
                if (_notificationController.isLoadingFirst.value) {
                  return ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Color.fromRGBO(122, 118, 118, 1),
                        highlightColor: Color.fromRGBO(255, 255, 255, 1),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                              ),
                              title: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                height: 15,
                                color: Colors.white,
                              ),
                              subtitle: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 10,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 10,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              trailing: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 100,
                                height: 35,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  if (_notificationController.notif.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada data",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          // controller: _scrollController,
                          itemCount: _notificationController.notif.length + 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index >= _notificationController.notif.length) {
                              return Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Obx(() {
                                    if (_notificationController
                                        .isScrollingLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Center(
                                        child: Text(
                                            "Semua notifikasi telah ditampilkan",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      );
                                    }
                                  }));
                            } else {
                              final item = _notificationController.notif[index];
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (item.salesId != null) {
                                        if (item.sales!.salesStatusId == 1) {
                                          Get.to(PaymentPage(
                                            salesId: item.salesId!,
                                            showHomeButton: false,
                                          ));
                                        } else {
                                          Get.to(RincianPembayaran(
                                            salesId: item.salesId!,
                                            showHomeButton: false,
                                          ));
                                        }
                                      } else {
                                        null;
                                      }
                                    },
                                    child: Card(
                                      elevation: 4, // Card elevation (shadow)
                                      margin: EdgeInsets.all(
                                          16), // Margin around the card
                                      child: Column(
                                        children: <Widget>[
                                          // Card Header
                                          ListTile(
                                            // Header icon (optional)
                                            title: Text(
                                              "${item.title}",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: setColor(item
                                                                  .sales ==
                                                              null
                                                          ? 0
                                                          : item.sales!
                                                              .salesStatusId!))),
                                            ),
                                            leading: Visibility(
                                                visible: item.isRead != "0"
                                                    ? false
                                                    : true,
                                                child: Icon(
                                                  Icons.circle,
                                                  color: Colors.red,
                                                  size: 15,
                                                )),
                                            trailing: Text(
                                              DateFormat('dd MMM yyyy', 'id_ID')
                                                  .format(item.createdAt!),
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          Color(0xff9A9A9A))),
                                            ),
                                            minLeadingWidth: 10,
                                          ),
                                          Divider(), // Divider line

                                          // Card Body
                                          ListTile(
                                            leading: item.sales == null
                                                ? Icon(
                                                    Icons.notifications,
                                                    color: Colors.amber[700],
                                                    size: 40,
                                                  )
                                                : Image.network(
                                                    "${item.sales?.product?.coverImage}", // Replace with your image URL
                                                    width:
                                                        50, // Adjust the width as needed
                                                    height:
                                                        50, // Adjust the height as needed
                                                    fit: BoxFit.contain,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      );
                                                    },
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Text(
                                                          'Failed to load image');
                                                    },
                                                  ),
                                            title: Text(
                                              item.sales == null
                                                  ? item.body.toString()
                                                  : "${item.sales?.typeProduct}",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey[500])),
                                            ),
                                            subtitle: Text(
                                              item.sales == null
                                                  ? ""
                                                  : "${item.sales?.product?.title}",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey[500])),
                                            ),
                                            contentPadding: EdgeInsets.all(10),
                                          ),
                                          SizedBox(height: 10),
                                          Visibility(
                                            visible: item.sales == null
                                                  ? false
                                                  : true,
                                            child: Container(
                                                child: Padding(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    item.sales?.product?.price ==
                                                            null
                                                        ? ""
                                                        : "${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(int.parse(item.sales!.product!.price.toString()))}",
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors
                                                                .grey[700]))),
                                              ),
                                            )),
                                          ),
                                          Visibility(
                                              visible: item.sales == null
                                                  ? false
                                                  : true,
                                              child: SizedBox(height: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    );
                  }
                }
              },
            ),
          ]),
        ));
  }

  Color setColor(int status) {
    if (status == 1) {
      return Colors.indigoAccent;
    } else if (status == 2) {
      return Colors.orange;
    } else if (status == 3) {
      return Color(0xff8BC523);
    } else if (status == 4) {
      return Color(0xffFF0000);
    } else {
      return Colors.black;
    }
  }
}
