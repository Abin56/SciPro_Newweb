import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class UpdateStudyMaterial extends StatefulWidget {
  const UpdateStudyMaterial({Key? key}) : super(key: key);

  @override
  State<UpdateStudyMaterial> createState() => _UpdateStudyMaterial();
}



class _UpdateStudyMaterial extends State<UpdateStudyMaterial> {

  String timeText = "";
  String dateText = "";
  String roomName = "";

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

  getRoomID() {
    var random= Random();
    roomName = (random.nextInt(10000000) + 10000000).toString();
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
    return SingleChildScrollView(

      child:Column(
        children:[
        SizedBox(
          width: screenSize.width*1/3,
          height: screenSize.height*1/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[

                  const Center( child:Text("Update Study Materials",style: TextStyle(
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
                  const SizedBox(height: 10,),
                  Container(
                      padding: const EdgeInsets.symmetric( vertical: 5),
                      child:
                      CustomButton(text:'Upload', onPressed: (){})
                  ),
                ],
              )
      )
    ]
      )
    );
  }
}


