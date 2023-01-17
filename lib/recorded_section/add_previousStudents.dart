import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/recorded_section/jsa_rec_addmail.dart';


import '../widgets/button_Container.dart';
import 'JLA_REC_addmail.dart';
import 'JLA_addmail.dart';
import 'jsa_live_addmail.dart';

class PreviousStudentCourseListScreen extends StatelessWidget {
  const PreviousStudentCourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your Course'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JSALIVEAddMailSCreen()),
              );
            },
            child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Text('JSA Live Course',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JSARECAddMailSCreen()),
              );
            },
            child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Text('JSA Recorded Course',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JLALiveAddMailSCreen()),
              );
            },
            child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Text('JLA Live Course',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JLARECAddMailSCreen()),
              );
            },
            child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Center(
                  child: Text('JLA Recorded Course',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
          ),
        ],
      ),
    );
  }
}
