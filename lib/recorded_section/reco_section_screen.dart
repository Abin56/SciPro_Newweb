import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/recorded_section/drop_down.dart';
import 'package:lepton_sci_web/recorded_section/invoice_screen.dart';
import 'package:lepton_sci_web/recorded_section/pdf_section.dart';
import 'package:lepton_sci_web/recorded_section/thumbnail.dart';

import '../course_contents/subscibed_students.dart';
import '../widgets/button_container.dart';
import 'add_previousStudents.dart';
import 'allvideosandupload.dart';
import 'create_newrec_screen.dart';
import 'list_recorded_course.dart';

class RecordedSectionListScreen extends StatelessWidget {
  const RecordedSectionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Recorded Sections"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PreviousStudentCourseListScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Add PreviousStudrnts',
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
                        builder: (context) =>
                            const RecordedSubscribedStudents()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Subscribed Students',
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
                        builder: (context) =>
                            const RecordedCoursesListScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Recorded Courses ',
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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubRecInvoice(
                              collection_name: "Rec_Invoice_Collection",
                            )),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Get Invoice',
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
                        builder: (context) => CreateNewRecordedCourseScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Create New Recorded Courses ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllvideosandUploadScreen()),
                  );
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 5,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      'Upload Videos',
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
        ],
      )),
    );
  }
}
