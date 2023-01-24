import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/book_section/sciPro-ad.dart';
import 'package:lepton_sci_web/model/study_material/s_m_categoryModel.dart';
import 'package:lepton_sci_web/widgets/button_Container.dart';

class StudyMaterialCategoryScreen extends StatelessWidget {
  StudyMaterialCategoryScreen({super.key});
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            controller: categoryController,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              helperText: 'Enter Category Name',
              helperStyle: TextStyle(color: Colors.black),
              isDense: true,
              filled: true,
              fillColor: Color.fromARGB(0, 16, 16, 16),
              hintText: 'Category',
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
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              final catDetails = StudyMateriCategoryModel(
                  id: '', courseTitle: categoryController.text.trim());
              StudyMaterialCategoryToFireBase()
                  .studyMaterialCategoryController(catDetails, context);
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 60,
              width: 250,
              child: Center(
                child: Text(
                  'Add Category ',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
