import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/utils/top_bar_contents.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

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
                  Text("SCIPRO Privacy Policy",
                    style:
                    TextStyle(color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp1.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp2.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp3.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp4.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp5.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp6.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp7.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp8.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp9.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp10.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp11.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp12.png"),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/pp13.png"),
                  SizedBox(height: 10,),

                ],
              ),
            ),
        ),
      ),
    );
  }
}
