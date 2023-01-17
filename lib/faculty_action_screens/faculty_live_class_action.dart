import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class FacultyLiveClassAction extends StatefulWidget {
  const FacultyLiveClassAction({Key? key}) : super(key: key);

  @override
  State<FacultyLiveClassAction> createState() => _FacultyRecordedClassActionState();
}



class _FacultyRecordedClassActionState extends State<FacultyLiveClassAction> {

  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime(){
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }


  @override
  void initState() {

    super.initState();

    //date
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(child:
    Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
              margin: const EdgeInsets.only(top:20,),
              width: screenSize.width*1/4,
              //color: Colors.redAccent,
              //height: screenSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  Container(
                      width: screenSize.width*1/4,
                      color: Colors.blue,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Container(
                            alignment: Alignment.center,
                            width: screenSize.width*0.3,
                              height: 200,
                              child:
                              const
                                Text("Last Live Session",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                ),),
                          Container(
                            width: screenSize.width*1/4,
                            margin:  const EdgeInsets.only(top: 20, left: 30),
                            child:  const  Text("Title: " + "abc course ",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: screenSize.width*1/4,
                            margin:  const EdgeInsets.only(top: 20, left: 30),
                            child:   Text(dateText + "   " + timeText,style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: screenSize.width*1/4,
                            margin:  const EdgeInsets.only(top: 20, left: 30),
                            child:   Text("Day 10",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: screenSize.width*1/4,
                            margin:  const EdgeInsets.only(top: 20, left: 30),
                            child:  const  Text("Description: " + "abc course ",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: screenSize.width*1/4,
                            margin:  const EdgeInsets.only(top: 20, left: 30),
                            child:  const  Text("Duration: " + "abc course ",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 30,)
                        ],)
                  ),
                  const SizedBox(height: 10),
                  const Center( child:Text("Update Live Course",style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),),
                  const SizedBox(height: 5,),
                   const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                      ),
                    ),
                  const SizedBox(height: 5,),
                   const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Discription',
                      ),
                    ),
                  const SizedBox(height: 5,),
                 const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Duration',
                      ),
                    ),
                  const SizedBox(height: 5,),
                   const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Fees',
                      ),
                    ),
                  SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.symmetric( vertical: 5),
                      child:
                      CustomButton(text:'Upload', onPressed: (){})
                  ),
                ],
              ),
          ),

        ]),
    );
  }
}


