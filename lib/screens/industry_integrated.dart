import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndustryIntegrated extends StatelessWidget {
  const IndustryIntegrated({Key? key}) : super(key: key);

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
          backgroundColor: Colors.white,
          flexibleSpace:
          Container
            (
            height: 70,
            width: screenSize.width,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellowAccent,
                Colors.black,
                Colors.yellowAccent,],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(width: 100,),
                Image.asset("assets/images/SCIPRO.png",height: 40,),
                SizedBox(width: screenSize.width*0.3),

                Container(child: Text("Proudly Presents",
                  style: TextStyle(
                      fontSize: screenSize.width*1/60,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),)),

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
      SingleChildScrollView(
          child: Container(
            color: Colors.black87,
            child: Column(
              children: [
            Container(
              color: Colors.black87,
              child: Row(
                children: [
                  Stack(
                    children:[
                  Container(
                    child: Image.asset("assets/images/electron2.jpg",width: screenSize.width,),
                  ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: screenSize.height*1/5,horizontal: screenSize.width*1/8),
                        child: Text("Industry Integrated Courses",style: TextStyle(
                          color: Colors.cyanAccent,fontSize: screenSize.width*1/70
                        ),),
                      ),
                         Padding(
                          padding: EdgeInsets.symmetric(vertical: screenSize.height*1/4,horizontal: screenSize.width*1/8),
                          child: Text(
                                "The industry-integrated concept being unique, focuses on\n"
                                "Profile mapping, skill gap analysis, industry analysis\n"
                                "and training the students the way industry expects.\n"
                                "These courses provide knowledge and skills relevant to the\n"
                                "industry and enhance whatever you have learned in your \n"
                                "degree course. Industry-oriented integrated courses are \n"
                                "designed by professionals who are a part of the industry \n"
                                "and know what needs to be taught to the students.",style: TextStyle(
                              fontSize: screenSize.width*1/80,
                            color: Colors.white
                          ),),
                        ),

                    ]
                  )
                ],
              ),
            ),
                Container(
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [

                          Text("Embedded system & IoT Engineer - Trainee",style: TextStyle(
                      color: Colors.cyanAccent,fontSize: screenSize.width*1/70),),

                          Center(
                            child: Container(
                              width: screenSize.width*0.4,
                              margin: EdgeInsets.all(screenSize.width*1/70,),
                              padding: EdgeInsets.all(screenSize.width*1/70),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.yellow, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent
                              ),
                              alignment: Alignment.topCenter,
                              child:
                              Container(
                                color: Colors.transparent,
                                margin: EdgeInsets.all(screenSize.width*1/70,),
                                padding: EdgeInsets.all(screenSize.width*1/70),
                                child: Text(
                                  "First week – Basic Training (Theoretical)\n"
                                      "                                     \n"
                                      "Next week onwards Up to 3 Months – Practical Training on Projects\n"
                                      "After 3 Months – Training on Live IoT Projects..\n"
                                      "( During this Period, Company will provide a Stipend to Trainees for each month.)\n"
                                      "After 6 months – Assessment will be there. Based on the performance in the\n"
                                      "assessment, Trainees will be appointed permanently in the company.\n"

                                      "*If any trainees are not up to the mark, we will give 6 month experience certificate to them.\n"
                                      "       ",
                                  maxLines: 15,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.width*1/90,
                                  ),),
                              ),
                            ),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Text("Cross Platform Mobile App Developer - Trainee",style: TextStyle(
                              color: Colors.cyanAccent,fontSize: screenSize.width*1/70),),
                          Center(
                            child: Container(
                              width: screenSize.width*0.4,
                              margin: EdgeInsets.all(screenSize.width*1/70,),
                              padding: EdgeInsets.all(screenSize.width*1/70),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.yellow, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent
                              ),
                              alignment: Alignment.topCenter,
                              child:
                              Container(
                                color: Colors.transparent,
                                margin: EdgeInsets.all(screenSize.width*1/70,),
                                padding: EdgeInsets.all(screenSize.width*1/70),
                                child: Text(
                                  "First week – Basic Training (Theoretical)\n"
                                      "                                            \n"
                                      "Next week onwards Up to 3 Months – Practical Training on Projects\n"
                                      "After 3 Months – Training on Live Cross Platform Application Projects..\n"
                                      "( During this period, Company will provide a Stipend to Trainees for each month.)\n"
                                      "After 6 months – Assessment will be there.\n"
                                      "Based on the performance in the assessment, Trainees will be \n"
                                      "appointed permanently in the company.\n"


                                      "*If any trainees are not up to the mark, we will give 6 month experience certificate to them.",
                                  maxLines: 15,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.width*1/90,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                )
        ],
      ),
          )
      )
    );
  }
}




