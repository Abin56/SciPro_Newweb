import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/liveSection/sub_live_students.dart';
import 'package:lepton_sci_web/recorded_section/invoice_screen.dart';

import '../widgets/button_container.dart';
import 'createLiveCourse.dart';
import 'livecourses_live.dart';

class LiveSectionSelectionScreen extends StatelessWidget {
  const LiveSectionSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Sections"),
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
                          builder: (context) => const SubLiveStudents()),
                    );
                  },
                  child: ButtonContainerWidget(
                    curving: 30,
                    colorindex: 0,
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
                          builder: (context) => LiveCoursesListScreen()),
                    );
                  },
                  child: ButtonContainerWidget(
                    curving: 30,
                    colorindex: 0,
                    height: 200,
                    width: 400,
                    child: Center(
                      child: Text(
                        'Live Courses ',
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateLiveCourseScreen()),
                );
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 200,
                width: 400,
                child: Center(
                  child: Text(
                    'Create Live Courses ',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubRecInvoice(
                                collection_name: "Live_Invoice_Collection",
                              )),
                    );
                  },
                  child: ButtonContainerWidget(
                    curving: 30,
                    colorindex: 0,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
