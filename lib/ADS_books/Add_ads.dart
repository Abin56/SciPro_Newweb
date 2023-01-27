import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/model/Ads_book/ads_book_model.dart';
import 'package:lepton_sci_web/model/study_material/study_materil.dart';
import 'package:lepton_sci_web/widgets/button_container.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class UploadADSBooksToFirebaseScreen extends StatefulWidget {
  const UploadADSBooksToFirebaseScreen({super.key});

  @override
  State<UploadADSBooksToFirebaseScreen> createState() =>
      _UploadADSBooksToFirebaseScreenState();
}

class _UploadADSBooksToFirebaseScreenState
    extends State<UploadADSBooksToFirebaseScreen> {
  String? networkMaterialPath;

  double videoProgress = 0.0;

  TextEditingController namweController = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Upload Section"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: namweController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      helperText: 'Enter Name of the book',
                      helperStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintText: 'Enter Name of the book',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      helperText: 'price of the book',
                      helperStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintText: 'Enter price of the book',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: TextFormField(
                      maxLines: null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.multiline,
                      controller: descriptionControler,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        helperText: 'Enter Description',
                        helperStyle: TextStyle(color: Colors.black),
                        isDense: true,
                        filled: true,
                        fillColor: Color.fromARGB(0, 16, 16, 16),
                        hintText: 'Enter Discripitions',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            Uint8List? file = result.files.first.bytes;
                            String filename = result.files.first.name;
                            UploadTask task = FirebaseStorage.instance
                                .ref()
                                .child("files/Studymaterials/$filename")
                                .putData(file!);
                            task.snapshotEvents.listen(
                              (event) {
                                setState(
                                  () {
                                    videoProgress = ((event.bytesTransferred
                                                    .toDouble() /
                                                event.totalBytes.toDouble()) *
                                            100)
                                        .roundToDouble();
                                    if (videoProgress == 100) {
                                      event.ref.getDownloadURL().then(
                                        (videoUrl) {
                                          log(videoUrl);
                                          setState(
                                            () {
                                              networkMaterialPath = videoUrl;
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 5,
                          height: 60,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Upload File",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: LiquidCircularProgressIndicator(
                          value: videoProgress / 100,
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.pinkAccent),
                          backgroundColor: Colors.white,
                          direction: Axis.vertical,
                          center: Text(
                            "$videoProgress%",
                            style: GoogleFonts.poppins(
                                color: Colors.black87, fontSize: 25.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final adsDetails = AddADSBookModel(
                              id: '',
                              bookImage: networkMaterialPath!,
                              discripition: descriptionControler.text.trim(),
                              bookPrice: priceController.text.trim(),
                              nameofthebook: namweController.text.trim(),
                              onpress: false);
                          ADSBookAddToFireBase()
                              .aDSBookAddModelController(adsDetails, context);
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 5,
                          height: 60,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Upload to Server",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
