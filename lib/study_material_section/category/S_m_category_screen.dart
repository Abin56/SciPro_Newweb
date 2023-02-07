import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/faculties/faculties_list.dart';
import 'package:lepton_sci_web/study_material_section/ForLive/Screen.dart';
import 'package:lepton_sci_web/study_material_section/category/add_new_category.dart';
import 'package:lepton_sci_web/study_material_section/category/list_of_category.dart';
import 'package:lepton_sci_web/study_material_section/list_of_S-material.dart';
import 'package:lepton_sci_web/widgets/button_container.dart';

class SmCategoryScreen extends StatelessWidget {
  String? id;
  SmCategoryScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListofStudyMaterialScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 1,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'For Recorded Courses',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListofStudyMaterialLiveScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 1,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'For Live Courses',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
