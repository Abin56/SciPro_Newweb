import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/responsive.dart';


class CurrentCoursesMainPage extends StatefulWidget {
  const CurrentCoursesMainPage({Key? key}) : super(key: key);

  @override
  State<CurrentCoursesMainPage> createState() => _CurrentCoursesMainPageState();
}

class _CurrentCoursesMainPageState extends State<CurrentCoursesMainPage> {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery
        .of(context)
        .size;
    return Center(
      child:
      ResponsiveWidget.isSmallScreen(context)
          ?
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Live Courses",
                                style:TextStyle(
                                  color:Colors.white,
                                fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main13archanartist.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Features",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          Container(
                            width: screenSize.width,
                            height: 375,
                            child: ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live lecture with white board &\n"
                                        "Class room tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Interactive session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live doubt session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Malayalam and English",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹3999(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){

                              }, child:
                          Container(
                            alignment: Alignment.center,
                              height: 20,
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/45
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
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Recorded Courses",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/mainsanush1.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Features",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          Container(
                            width: screenSize.width,
                            height: 375,
                            child: ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Recorded videos with class room\n"
                                        "tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Malayalam & English",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Free Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹3499(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            }, child:
                          Container(
                              alignment: Alignment.center,
                              height: 20,
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/45
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
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Hybrid Courses",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main15archana.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),

                            ),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Features",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          Container(
                            width: screenSize.width,
                            height: 375,
                            child: ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live lecture with white board &\n"
                                        "Class room tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Interactive session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Recorded videos with class roomtools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Live Doubt Session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Malayalam & English",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Free Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹6499(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            }, child:
                          Container(
                              alignment: Alignment.center,
                              height: 20,
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/45
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
          )
          :
          Row(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width*1/3-20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Live Courses",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width*1/3,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main13archanaartist.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                            ),),
                          Container(
                              color: Colors.transparent,
                              child:  Center(child: Text("Features",style: TextStyle(
                                  color: Colors.white,fontSize: screenSize.height*1/30
                              ) ))
                          ),
                          Container(
                            width: screenSize.width*1/3,
                            height: 500,
                            child:
                            ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live lecture with white board &\n"
                                        "Class room tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Interactive session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live doubt session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Malayalam and English",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹3999(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                            }, child:
                          Container(
                              width: 300,
                              height: 40,
                              margin: EdgeInsets.all(35),
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/60
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width*1/3-20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Recorded Courses",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width*1/3,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/mainsanush1.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                            ),),
                          Container(
                              color: Colors.transparent,
                              child:  Center(child: Text("Features",style: TextStyle(
                                  color: Colors.white,fontSize: screenSize.height*1/30
                              ) ))
                          ),
                          Container(
                            width: screenSize.width*1/3,
                            height: 500,
                            child:
                            ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Recorded videos with class room\n"
                                        "tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Malayalam & English",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Free Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹3499(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                            }, child:
                          Container(
                              width: 300,
                              height: 40,
                              margin: EdgeInsets.all(35),
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/60
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: screenSize.width*1/3-20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xecd3301e),width: 2),
                          borderRadius: BorderRadius.circular(0),
                          gradient: const LinearGradient(
                              colors: [Color(0xecd3301e),
                                Color(0xecd3301e),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          )
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Hybrid Courses",
                                style:TextStyle(
                                    color:Colors.white,
                                    fontSize: screenSize.height*1/30)),
                          ),
                          InkWell(
                            onTap:() {
                              Navigator.pushNamed(context, '/csir_course_page');
                            },
                            child:
                            Container(
                              width: screenSize.width*1/3,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/main15archana.jpg",
                                      ),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white,
                                        Colors.white,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight
                                  )
                              ),
                            ),),
                          Container(
                              color: Colors.transparent,
                              child:  Center(child: Text("Features",style: TextStyle(
                                  color: Colors.white,fontSize: screenSize.height*1/30
                              ) ))
                          ),
                          Container(
                            width: screenSize.width*1/3,
                            height: 500,
                            child:
                            ListView(
                              children:
                              <Widget>
                              [
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Live lecture with white board &\n"
                                        "Class room tools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("3 months Duration",
                                    style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ,)
                                  ),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Interactive session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                  height: screenSize.height*1/15,
                                  color: Colors.black,
                                  child:  Center(child: Text("Teachers Support",style: TextStyle(
                                      color: Colors.white,fontSize: screenSize.height*1/40
                                  ) )),
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Recorded videos with class roomtools",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Live Doubt Session",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Malayalam & English",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.black,
                                    child:  Center(child: Text("Free Study Materials",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),
                                Container(
                                    height: screenSize.height*1/15,
                                    color: Colors.blueGrey,
                                    child:  Center(child: Text("Fee ₹6499(Including GST)",style: TextStyle(
                                        color: Colors.white,fontSize: screenSize.height*1/40
                                    ) ))
                                ),

                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                            }, child:
                          Container(
                              width: 300,
                              height: 40,
                              margin: EdgeInsets.all(35),
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
                              child:  Center(child: Text("Explore Courses",style: TextStyle(
                                  color: Colors.black,fontSize: screenSize.width*1/60
                              ) ))
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
    );
  }
}
