import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/utils/top_bar_contents.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    double _scrollPosition = 0;
    double _opacity = 0;


    var screenSize = MediaQuery
        .of(context)
        .size;
    _opacity = _scrollPosition < screenSize.height * 0.70
        ? _scrollPosition / (screenSize.height * 0.70)
        : 1;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          flexibleSpace:
          TopBarContents(
              _opacity)
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [

                SizedBox(height: 30,),
                Text("SCIPRO TERMS & CONDITIONS",
                  style:
                  TextStyle(color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov1.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov2.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov3.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov4.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov5.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov6.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov7.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov8.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov9.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov10.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov11.png"),
                SizedBox(height: 10,),
                Image.asset("assets/images/ov12.png"),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}