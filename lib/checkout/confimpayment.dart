import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mafiaeducation/bottombar.dart';
import 'package:mafiaeducation/checkout/rincian.dart';
import 'package:mafiaeducation/controllers/flash_controller.dart';
import 'package:mafiaeducation/controllers/sales_controller.dart';
import 'package:mafiaeducation/controllers/user_controller.dart';

class ConfirmPaymentPage extends StatefulWidget {
  final String salesId;
  const ConfirmPaymentPage({super.key, required this.salesId});

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  final SalesController _salesController = Get.put(SalesController());
  final UserController _userController = Get.find();
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController metodeInput = TextEditingController();
  final TextEditingController nominalInput = TextEditingController();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController imageInput = TextEditingController();
  bool canSubmit = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
    dateInput.text = "";
    // Listen for changes in text fields
    nameInput.addListener(_validateForm);
    dateInput.addListener(_validateForm);
    nominalInput.addListener(_validateForm);
    metodeInput.addListener(_validateForm);
    imageInput.addListener(_validateForm);
  }

  Future<void> _fetchData() async {
    // Simulate an asynchronous task, such as fetching data from an API
    metodeInput.text = "Memuat data";
    nameInput.text = _userController.user.value.fullName.toString();
    await _salesController.getSales(widget.salesId).then((value) {
      setState(() {
        metodeInput.text =
            'Transfer ${_salesController.sales.value.paymentMethod!.description!}';

        nominalInput.text = _salesController.sales.value.totalPrice.toString();
      });
    }).catchError((e) {
      FlashController().flashMessage(FlashMessageType.error,
          title: FlashController().setProperError(e.toString()));
      Get.off(const BottomBar());
    });
  }

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imageInput.text = _image!.path;
      } else {
        print('No image selected.');
      }
    });
  }

  // Validation function
  void _validateForm() {
    setState(() {
      // Check if both text fields are not empty
      canSubmit = nameInput.text.isNotEmpty &&
          dateInput.text.isNotEmpty &&
          nominalInput.text.isNotEmpty &&
          metodeInput.text != "Memuat data" &&
          imageInput.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Konfirmasi Pembayaran",
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
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama pengirim",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        controller: nameInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Nama pengirim",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Tanggal transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedData = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          if (pickedData != null) {
                            String formattedDate =
                                DateFormat("dd-MM-yyyy").format(pickedData);
                            setState(() {
                              dateInput.text = formattedDate.toString();
                            });
                          } else {
                            print("Not selected");
                          }
                        },
                        controller: dateInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Tanggal transfer",
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Nominal transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                      controller: nominalInput,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Masukan nominal transfer",
                        hintStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff9A9A9A),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xff9a9a9a),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xff9a9a9a),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Metode pembayaran",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    TextField(
                        readOnly: true,
                        controller: metodeInput,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: Color(0xffEEEEEE),
                          filled: true,
                          hintStyle: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff9A9A9A))),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Color(0xff9a9a9a))),
                        )),
                    SizedBox(height: 20),
                    Text("Bukti transfer",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    _image == null
                        ? Text('Klik unggah gambar')
                        : Image.file(_image!),
                    ElevatedButton(
                      onPressed: getImage,
                      child: Text('Unggah Gambar'),
                    ),
                  ],
                ),
              )
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
                    onPressed: (canSubmit) && _salesController.isConfirm.value
                        ? () {
                            _salesController.isConfirm.value = false;
                            Get.dialog(
                                Center(child: CircularProgressIndicator()),
                                barrierDismissible: false);
                            _salesController.isConfirm.value = false;
                            _salesController
                                .confirmPayment({
                                  "sales_id": _salesController.sales.value.id,
                                  "account_name": nameInput.text,
                                  "payment_method_id": _salesController
                                      .sales.value.paymentMethod!.id,
                                  "amount": nominalInput.text,
                                }, _image!.path)
                                .then((value) => Get.off(RincianPembayaran(
                                    salesId: _salesController.sales.value.id!,
                                    showHomeButton: true)))
                                .catchError((e) {
                                  _salesController.isConfirm.value = true;
                                  Get.back();
                                  FlashController().flashMessage(
                                      FlashMessageType.error,
                                      title: FlashController()
                                          .setProperError(e.toString()));
                                  return null;
                                });
                          }
                        : null,
                    child: Text("Submit",
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
