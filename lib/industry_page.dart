import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IndustryPage extends StatelessWidget {
  IndustryPage({Key? key}) : super(key: key);
  double _scrollPosition = 0;
  double _opacity = 0;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    _opacity = _scrollPosition < screenSize.height * 0.70
        ? _scrollPosition / (screenSize.height * 0.70)
        : 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace:
        Container
          (
          height: 70,
          width: screenSize.width,
          color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(width: 100,),
              Image.asset("assets/images/SCIPRO.png",height: 40,),
              SizedBox(width: screenSize.width*0.3),

              Container(child: Text("Industry Integrated Courses",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),

              Expanded(child: Container()),
              TextButton(onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
              }, child: const Text("",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),),),
            ],
          ),

        )
    ),
      body:
      SingleChildScrollView(child:

      Container(
        width: screenSize.width,
        color: Color (0xfc590404),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  color: Color (0xfc590404),
                  width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset("assets/images/INDU.png",
                              height: screenSize.height * 1 / 2
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: Color (0xfc590404),
                            child: Text("Industry Integrated Courses",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width*1/90,
                              ),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(screenSize.width*1/40,),
                          padding: EdgeInsets.all(screenSize.width*1/70),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow, width: 3),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Container(
                            height: screenSize.height * 1 / 2,
                            padding: EdgeInsets.all(screenSize.width*1/50),
                            child: Text(
                                "The industry-integrated concept being unique, focuses\n"
                                    " on Profile mapping, skill gap analysis, industry analysis\n"
                                    " and training the students the way industry expects.\n"
                                    "These courses provide knowledge and skills relevant to the\n"
                                    "industry and enhance whatever you have learned in your degree\n"
                                    "course. Industry-oriented integrated courses are designed by\n"
                                    " professionals who are a part of the industry and know what\n"
                                    " needs to be taught to the students.",style: TextStyle(
                                fontSize: screenSize.width*1/90
                            ),),

                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            color: Color (0xfc590404),
            width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(

                          color: Color (0xfc590404),
                          alignment: Alignment.topCenter,
                          height: screenSize.height * 1 / 2,
                          width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
                          child:
                          Container(height: screenSize.height * 1 / 2,
                            child: Image.asset("assets/images/iot.png",
                              height: screenSize.height * 0.6,
                            ),
                          ),),
                        Center(
                          child: Container(
                            width: screenSize.width*1/4,
                            margin: EdgeInsets.only(left: 30, top: 5),
                            child: Text("Embedded System Engineer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: screenSize.width*1/60,
                              ),),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: screenSize.width*1/5,
                          margin: EdgeInsets.only(left: 30, top: 35),
                          child: Text("Course PERIOD – 6 Months",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                              fontSize: screenSize.width*1/80,
                            ),),
                        ),

                        Container(
                          height:screenSize.height  ,
                          margin: EdgeInsets.only(top: screenSize.height * 1 / 2),
                          color: Color (0xfc590404),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  width: screenSize.width*1/7,
                                  padding: EdgeInsets.all(5),
                                  color: Color (0xfc590404),
                                  child: Text("Course Structure",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width*1/90,
                                    ),),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(screenSize.width*1/70,),
                                  padding: EdgeInsets.all(screenSize.width*1/70),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellow, width: 3),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                  ),
                                  alignment: Alignment.topCenter,
                                  child:
                                  Container(
                                    margin: EdgeInsets.all(screenSize.width*1/70,),
                                    padding: EdgeInsets.all(screenSize.width*1/70),
                                    child: Text(
                                      "First week – Basic Training (Theoretical)\n"
                                          "                                            \n"
                                          "Next week onwards Up to 3 Months – Practical Training on Projects\n"
                                          "After 3 Months – Training on Live Projects..\n"
                                          "( At that time, Company will provide a Stipend toTrainees for each month.)\n"
                                          "After 6 months – Assessment will be there. Based on the performance in the\n"
                                          "assessment, Trainees will be appointed permanently in the company.\n"
                                          "*If any trainees are not up to the mark, we will give 6 month experience\n"
                                          "certificate to them.",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: screenSize.width*1/90,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])
                ]),
          ),
          Container(
            margin: EdgeInsets.all(30),
            color: Color (0xfc590404),
            width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(

                          color: Color (0xfc590404),
                          alignment: Alignment.topCenter,
                          height: screenSize.height * 1 / 2,
                          width: screenSize.width * 1 /3- (2*screenSize.width*1/35),
                          child:
                          Container(height: screenSize.height * 1 / 2,
                            child: Image.asset("assets/images/developer.jpeg",
                              height: screenSize.height * 0.6,
                            ),
                          ),),
                        Center(
                          child: Container(
                            width: screenSize.width*1/5,
                            margin: EdgeInsets.only(left: 30, top: 5),
                            child: Text("   Flutter Developer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: screenSize.width*1/60,
                              ),),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                            width: screenSize.width*1/5,
                            margin: EdgeInsets.only(left: 30, top: 35),
                            child: Text("Course PERIOD – 6 Months",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: screenSize.width*1/80,
                              ),),
                          ),

                        Container(
                          height:screenSize.height ,
                          margin: EdgeInsets.only(top: screenSize.height * 1 / 2),
                          color: Color (0xfc590404),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  width: screenSize.width*1/7,
                                  padding: EdgeInsets.all(5),
                                  color: Color (0xfc590404),
                                  child: Text("Course Structure",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width*1/90,
                                    ),),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(screenSize.width*1/70,),
                                  padding: EdgeInsets.all(screenSize.width*1/70),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellow, width: 3),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                  ),
                                  alignment: Alignment.topCenter,
                                  child:
                                  Container(
                                    margin: EdgeInsets.all(screenSize.width*1/70,),
                                    padding: EdgeInsets.all(screenSize.width*1/70),
                                    child: Text(
                                      "First week – Basic Training (Theoretical)\n"
                                          "                                            \n"
                                          "Next week onwards Up to 3 Months – Practical Training on Projects\n"
                                          "After 3 Months – Training on Live Projects..\n"
                                          "( At that time, Company will provide a Stipend toTrainees for each month.)\n"
                                          "After 6 months – Assessment will be there. Based on the performance in the\n"
                                          "assessment, Trainees will be appointed permanently in the company.\n"
                                          "*If any trainees are not up to the mark, we will give 6 month experience\n"
                                          "certificate to them.",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: screenSize.width*1/90,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])
                ]),
          ),
        ],),
      ),
      ),
    );
  }
}