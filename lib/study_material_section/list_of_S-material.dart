import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/study_material_section/all_S_M_category.dart';
import 'package:lepton_sci_web/study_material_section/all_studymaterials.dart';
import 'package:lepton_sci_web/study_material_section/upload_S-materil.dart';
import 'package:lepton_sci_web/widgets/button_Container.dart';

import 'category/S_m_category_screen.dart';

class ListofStudyMaterialScreen extends StatelessWidget {
  const ListofStudyMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Study Materials"),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllsmCategory()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'All StudyMaterials',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadStudyMaterialScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Upload New StudyMaterials',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmCategoryScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Category Session',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
