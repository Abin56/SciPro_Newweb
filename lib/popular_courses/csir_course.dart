import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CsirCourse extends StatefulWidget {
  const CsirCourse({Key? key}) : super(key: key);

  @override
  State<CsirCourse> createState() => _CsirCourseState();
}

class _CsirCourseState extends State<CsirCourse> {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery
        .of(context)
        .size;
    return Container(
      width: screenSize.width,
      height: screenSize.height*0.7,
      color: Color (0xf01a1a1a),
      child: Row(
        children: [

          Container(

              width: screenSize.width*1/2,
            height: screenSize.height,
            margin: EdgeInsets.all(screenSize.width*1/70,),
            padding: EdgeInsets.all(screenSize.width*1/70),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
            ),
            child: Text("       CSIR and UGC provide Research Fellowships for pursuing phD in University / National\n"
                "Laboratories and Institutions in various fields of Science.   A large number of  JRFs  are\n"
                "awarded each year by CSIR. Joint CSIR UGC NET is a test being conducted to determine\n"
                "the eligibility.",style: TextStyle(
              height: 5,
                color: Colors.black,
                fontSize: screenSize.width*1/90
            ),),),
          Container(width: screenSize.width*1/2.5,
            margin: EdgeInsets.all(screenSize.width*1/70,),
            padding: EdgeInsets.all(screenSize.width*1/70),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent
            ),
            child: Text("kjhbkjbkjblkjblj",style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width*1/90
            ),),
          )
        ],
      ),
    );
  }
}
