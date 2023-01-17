import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/responsive.dart';

class OurPopularCourses extends StatefulWidget {
  const OurPopularCourses({Key? key}) : super(key: key);

  @override
  State<OurPopularCourses> createState() => _OurPopularCoursesState();
}

class _OurPopularCoursesState extends State<OurPopularCourses> {
  final Uri _url = Uri.parse('https://storage.googleapis.com/scipro-bucket/app-release.apk');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child:
            ResponsiveWidget.isSmallScreen(context)
                ?
            Column(
              children: [
                Center(
                  child: Text("Our Popular Courses",
                    style:
                    TextStyle(
                        color: Colors.red,
                        fontSize: screenSize.height*1/25),),
                ),
                Container(
                  width: screenSize.width,
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
                          width: screenSize.width-1,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/main2ancy.jpg",
                                  ),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),

                        ),
                      ),
                      InkWell(
                        onTap: (){

                        }, child:
                      Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 200,
                          margin: EdgeInsets.all(screenSize.height*1/30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(screenSize.height*1/10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child:  Center(child: Text("CSIR UGC LIFESCIENCES",style: TextStyle(
                              color: Colors.black,fontSize: screenSize.width*1/45
                          ) ))
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: screenSize.width,
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
                          width: screenSize.width-1,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/main6akhilmon.jpg",
                                  ),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),

                        ),
                      ),
                      SizedBox(width: 40,),
                      InkWell(
                        onTap: (){

                        }, child:
                      Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 200,
                          margin: EdgeInsets.all(screenSize.height*1/30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(screenSize.height*1/10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child:  Center(child: Text("ICAR NET",style: TextStyle(
                              color: Colors.black,fontSize: screenSize.width*1/45
                          ) ))
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: screenSize.width,
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
                          width: screenSize.width-1,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/main6gopika.jpg",
                                  ),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),

                        ),
                      ),
                      InkWell(
                        onTap: (){

                        }, child:
                      Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 200,
                          margin: EdgeInsets.all(screenSize.height*1/30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(screenSize.height*1/10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child:  Center(child: Text("CUT PG LIFESCIENCE",style: TextStyle(
                              color: Colors.black,fontSize: screenSize.width*1/45
                          ) ))
                      ),)
                    ],
                  ),
                ),
              ],
            )
                :
            Column(
              children: [
                Center(
                  child: Text("Our Popular Courses",
                    style:
                    TextStyle(
                        color: Colors.red,
                        fontSize: screenSize.height*1/25),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenSize.width/3.5,
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
                              width: screenSize.width/3.5-1,
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main2ancy.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),
                          ),
                          InkWell(
                            onTap: (){

                            }, child:
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 225,
                              margin: EdgeInsets.all(screenSize.height*1/30),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xecd3301e),width: 2),
                                  borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                              child:  Center(child: Text("CSIR UGC LIFESCIENCES",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/90
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(width: 40,),
                    Container(
                      width: screenSize.width/3.5,
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
                              width: screenSize.width/3.5-1,
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main6akhilmon.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),
                          ),
                          SizedBox(width: 40,),
                          InkWell(
                            onTap: (){

                            }, child:
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 225,
                              margin: EdgeInsets.all(screenSize.height*1/30),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xecd3301e),width: 2),
                                  borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                              child:  Center(child: Text("ICAR NET",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/90
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(width: 40,),
                    Container(
                      width: screenSize.width/3.5,
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
                              width: screenSize.width/3.5-1,
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main6gopika.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),
                          ),
                          InkWell(
                            onTap: (){

                            }, child:
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 225,
                              margin: EdgeInsets.all(screenSize.height*1/30),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xecd3301e),width: 2),
                                  borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                              child:  Center(child: Text("CUT PG LIFESCIENCES",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/90
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(20),
          child:
          ResponsiveWidget.isSmallScreen(context)
              ?
          Column(
            children: [
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/mainexam1.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height:30,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("GATE EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/main8sara.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    SizedBox(width: 40,),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("ICMR-JRF EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/embed2.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("SCIPRO SKILLS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
            ],
          )
              :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenSize.width/3.5,
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
                        width: screenSize.width/3.5-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/mainexam1.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 225,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("GATE EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/90
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(width: 40,),
              Container(
                width: screenSize.width/3.5,
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
                        width: screenSize.width/3.5-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/main8sara.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    SizedBox(width: 40,),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 225,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("ICMR-JRF EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/90
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: screenSize.width/3.5,
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
                        width: screenSize.width/3.5-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/embed2.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("SCIPRO SKILLS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/90
                        ) ))
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(20),
          child:
          ResponsiveWidget.isSmallScreen(context)
              ?
          Column(
            children: [
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/main10vishnu.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("SET EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/main11archanashan.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    SizedBox(width: 40,),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("KPSC EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/main12nandhana.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("UPSC EXAMS",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screenSize.width,
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
                        width: screenSize.width-1,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/gopik_language.jpg",
                                ),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                      }, child:
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 200,
                        margin: EdgeInsets.all(screenSize.height*1/30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xecd3301e),width: 2),
                            borderRadius: BorderRadius.circular(screenSize.height*1/10),
                            gradient: const LinearGradient(
                                colors: [Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight
                            )
                        ),
                        child:  Center(child: Text("SciPro LANGUAGE COURSES",style: TextStyle(
                            color: Colors.black,fontSize: screenSize.width*1/45
                        ) ))
                    ),)
                  ],
                ),
              ),
            ],
          )
              :
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenSize.width/3.5,
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
                            width: screenSize.width/3.5-1,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/main10vishnu.jpg",
                                    ),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){

                          }, child:
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 200,
                            margin: EdgeInsets.all(screenSize.height*1/30),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child:  Center(child: Text("SET EXAMS",style: TextStyle(
                                color: Colors.black,fontSize: screenSize.width*1/90
                            ) ))
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(width: 40,),
                  Container(
                    width: screenSize.width/3.5,
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
                            width: screenSize.width/3.5-1,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/main11archanashan.jpg",
                                    ),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),

                          ),
                        ),
                        SizedBox(width: 40,),
                        InkWell(
                          onTap: (){

                          }, child:
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 200,
                            margin: EdgeInsets.all(screenSize.height*1/30),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child:  Center(child: Text("SET EXAMS",style: TextStyle(
                                color: Colors.black,fontSize: screenSize.width*1/90
                            ) ))
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(width: 40,),
                  Container(
                    width: screenSize.width/3.5,
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
                            width: screenSize.width/3.5-1,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/main12nandhana.jpg",
                                    ),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){

                          }, child:
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 200,
                            margin: EdgeInsets.all(screenSize.height*1/30),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(screenSize.height*1/10),
                                gradient: const LinearGradient(
                                    colors: [Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child:  Center(child: Text("UPSC EXAMS",style: TextStyle(
                                color: Colors.black,fontSize: screenSize.width*1/90
                            ) ))
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Center(
                child: Container(
                  width: screenSize.width/3.5,
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
                          width: screenSize.width/3.5-1,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/gopik_language.jpg",
                                  ),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),

                        ),
                      ),
                      InkWell(
                        onTap: (){

                        }, child:
                      Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 200,
                          margin: EdgeInsets.all(screenSize.height*1/30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xecd3301e),width: 2),
                              borderRadius: BorderRadius.circular(screenSize.height*1/10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child:  Center(child: Text("SciPro LANGUAGE COURSES",style: TextStyle(
                              color: Colors.black,fontSize: screenSize.width*1/95
                          ) ))
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

