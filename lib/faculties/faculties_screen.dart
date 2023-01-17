import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/faculties/faculties_list.dart';

import '../widgets/button_Container.dart';
import 'faculties_idandpass.dart';


class FacultyScreen extends StatelessWidget {
  String? id;
  FacultyScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        builder: (context) => FacultiesIDandPassScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 1,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Create Faculty',
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
                        builder: (context) => FacultiesProfileList()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 1,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'View Faculties',
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
