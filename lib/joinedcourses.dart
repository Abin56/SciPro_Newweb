import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinedCourses extends StatelessWidget {
  const JoinedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return Column(
      children:[
        Container(
          width: screenSize.width,
          child:
              Stack(
                  children: [
                    //Image.asset("assets/images/upfinal.png",width: screenSize.width,),

                    Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: screenSize.width*1/30,),
               Text("Our Popular Courses", style: TextStyle(
                  fontSize: screenSize.width*1/40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),),
              Container(
               // height: screenSize.height/2,
                padding: EdgeInsets.all(screenSize.height*1/20),
                child: Text("We are unique in our own way in conducting online courses for different competitive recruitment tests in India. Our focus is in science\n"
                  "subjects, even though we provide non science subjects too.  We help candidates to prepare  for their recruitment tests like GATE, UGC\n"
                  "NET, SET, CUET PG , RRB  ICMR-JRF, UPSC, STATE PSC etc..... by proving  live classes,  live test sessions,  live doubt clearing sessions,\n"
                  "recorded classes, study materials.", style: TextStyle(
                    fontSize: screenSize.height*1/60,
                    color: Colors.white,
                    ),),
              ),

              //Center(
                //child:
                Container(
                  padding: EdgeInsets.only(top: screenSize.width*1/40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: screenSize.width*1/4,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xecd3301e),width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Color(0xecd3301e),
                                              Color(0xecd3301e),
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap:() {
                                            Navigator.pushNamed(context, '/csir_course_page');
                                          },
                                          child:
                                          Container(
                                            width: screenSize.width*1/4.1,
                                            height: screenSize.width*1/15,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                    colors: [Colors.white,
                                                      Colors.white,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight
                                                )
                                            ),
                                            child: Padding(

                                              padding: const EdgeInsets.all(1.0),
                                              child: Image.asset("assets/images/lf.png",height: screenSize.width*1/15,width: screenSize.width*0.15,),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screenSize.width*1/4,
                                          //color: Color(0xecd3301e),
                                          height: screenSize.width*1/33,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Color(0xecd3301e),width: 2),
                                              borderRadius: BorderRadius.circular(10),
                                              gradient: const LinearGradient(
                                                  colors: [Color(0xecd3301e),
                                                    Color(0xecd3301e),
                                                  ],
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight
                                              )
                                          ),

                                          child: Center(
                                            child: Text("CSIR UGC LIFESCIENCE",
                                              style: TextStyle(
                                                  fontSize: screenSize.width*1/90,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        width: screenSize.width*1/3.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Color(0xecd3301e),
                                  Color(0xecd3301e),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap:() {
                                Navigator.pushNamed(context, '/csir_course_page');
                              },
                              child:
                              Container(
                                width: screenSize.width *.15,
                                height: screenSize.width*1/15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight
                                    )
                                ),
                                child: Padding(

                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset("assets/images/zool.png",height: screenSize.width*1/15,width: screenSize.width*0.15,),
                                ),
                              ),
                            ),
                            Container(
                              width: screenSize.width*1/3.5,
                              //color: Color(0xecd3301e),
                              height: screenSize.width*1/33,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xecd3301e),width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Color(0xecd3301e),
                                        Color(0xecd3301e),
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                              child: Center(
                                child: Text("CUET PG LIFESCIENCE",
                                  style: TextStyle(
                                      fontSize: screenSize.width*1/90,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        width: screenSize.width*1/3.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Color(0xecd3301e),
                                  Color(0xecd3301e),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap:() {
                                Navigator.pushNamed(context, '/csir_course_page');
                              },
                              child:
                              Container(
                                width: screenSize.width *.15,
                                height: screenSize.width*1/15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight
                                    )
                                ),
                                child: Padding(

                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset("assets/images/cells.png",height: screenSize.width*1/15,width: screenSize.width*0.15,),
                                ),
                              ),
                            ),
                            Container(
                              width: screenSize.width*1/3.5,
                              //color: Color(0xecd3301e),
                              height: screenSize.width*1/33,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xecd3301e),width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Color(0xecd3301e),
                                        Color(0xecd3301e),
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                              child: Center(
                                child: Text("ICAR NET",
                                  style: TextStyle(
                                      fontSize: screenSize.width*1/90,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30,),

                    ],
                  ),
                ),
              //),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: screenSize.width*1/3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color:Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:() {
                                  Navigator.pushNamed(context, '/csir_course_page');
                                },
                                child:
                                Container(
                                  width: screenSize.width *.15,
                                  height: screenSize.width*1/15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),
                                  child: Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/pop11.png",height: screenSize.width*1/16,width: screenSize.width*0.04,),
                                  ),
                                ),
                              ),
                              Container(
                                width: screenSize.width*1/3.5,
                                color: Color(0xecd3301e),
                                height: screenSize.width*1/33,

                                child: Center(
                                  child: Text("GATE EXAMS",
                                    style: TextStyle(
                                        fontSize: screenSize.width*1/90,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: screenSize.width*1/3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:() {
                                  Navigator.pushNamed(context, '/csir_course_page');
                                },
                                child:
                                Container(
                                  width: screenSize.width *.15,
                                  height: screenSize.width*1/15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),
                                  child: Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/computer.png",height: screenSize.width*1/16,width: screenSize.width*0.04,),
                                  ),
                                ),
                              ),
                              Container(
                                width: screenSize.width*1/3.5,
                                color: Color(0xecd3301e),
                                height: screenSize.width*1/33,

                                child: Center(
                                  child: Text("ICMR-JRF EXAMS",
                                    style: TextStyle(
                                        fontSize: screenSize.width*1/90,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: screenSize.width*1/3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:() {
                                  Navigator.pushNamed(context, '/csir_course_page');
                                },
                                child:
                                Container(
                                  width: screenSize.width *.15,
                                  height: screenSize.width*1/15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),
                                  child: Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/embed.png",height: screenSize.width*1/16,width: screenSize.width*0.04,),
                                  ),
                                ),
                              ),
                              Container(
                                width: screenSize.width*1/3.5,
                                color: Color(0xecd3301e),
                                height: screenSize.width*1/33,

                                child: Center(
                                  child: Text("EMBEDDED SYSTEMS",
                                    style: TextStyle(
                                        fontSize: screenSize.width*1/90,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                width: screenSize.width*1/3.5,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xecd3301e),width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [Color(0xecd3301e),
                                          Color(0xecd3301e),
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight
                                    )
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap:() {
                                        Navigator.pushNamed(context, '/csir_course_page');
                                      },
                                      child:
                                      Container(
                                        width: screenSize.width *.15,
                                        height: screenSize.width*1/15,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                                colors: [Colors.white,
                                                  Colors.white,
                                                ],
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight
                                            )
                                        ),
                                        child: Padding(

                                          padding: const EdgeInsets.all(1.0),
                                          child: Image.asset("assets/images/onexam.jpg",height: screenSize.width*1/15,width: screenSize.width*0.15,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: screenSize.width*1/3.5,
                                      color: Color(0xecd3301e),
                                      height: screenSize.width*1/33,

                                      child: Center(
                                        child: Text("SET EXAMS",
                                          style: TextStyle(
                                              fontSize: screenSize.width*1/90,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: screenSize.width*1/3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:() {
                                  Navigator.pushNamed(context, '/csir_course_page');
                                },
                                child:
                                Container(
                                  width: screenSize.width *.15,
                                  height: screenSize.width*1/15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),
                                  child: Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/real1.png",height: screenSize.width*1/16,width: screenSize.width*0.04,),
                                  ),
                                ),
                              ),
                              Container(
                                width: screenSize.width*1/3.5,
                                color: Color(0xecd3301e),
                                height: screenSize.width*1/33,

                                child: Center(
                                  child: Text("KERALA PSC EXAMS",
                                    style: TextStyle(
                                        fontSize: screenSize.width*1/90,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: screenSize.width*1/3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:() {
                                  Navigator.pushNamed(context, '/csir_course_page');
                                },
                                child:
                                Container(
                                  width: screenSize.width *.15,
                                  height: screenSize.width*1/15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),
                                  child: Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/test.png",height: screenSize.width*1/16,width: screenSize.width*0.04,),
                                  ),
                                ),
                              ),
                              Container(
                                width: screenSize.width*1/3.5,
                                color: Color(0xecd3301e),
                                height: screenSize.width*1/33,

                                child: Center(
                                  child: Text("UPSC EXAMS",
                                    style: TextStyle(
                                        fontSize: screenSize.width*1/90,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                ],
              ),
            ],
          ),
    ])
        )],
    );
  }
}
