import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/recorded_section/allCourse_videos.dart';
import 'package:lepton_sci_web/recorded_section/thumbnail.dart';
import 'package:lepton_sci_web/recorded_section/upload_video/upload_videoScreen.dart';
import 'package:lepton_sci_web/widgets/button_Container.dart';

class AllvideosandUploadScreen extends StatelessWidget {
  const AllvideosandUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCourseVideos()),
                );
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 4,
                height: 200,
                width: 400,
                child: Center(
                  child: Text(
                    'All Videos',
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
                  MaterialPageRoute(builder: (context) => UploadVideoScreen()),
                );
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 4,
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
      )),
    );
  }
}
