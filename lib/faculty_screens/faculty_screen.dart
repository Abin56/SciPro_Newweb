import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class FacultyScreen extends StatefulWidget {
  const FacultyScreen({Key? key}) : super(key: key);

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {

  late DatabaseReference database;

  @override
  void initState() {
    super.initState();
    database = FirebaseDatabase.instance as DatabaseReference;
    database = database.ref.child('Video').child('start');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:
        Center(
      child:
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text('Start Class',style: TextStyle (color:Colors.yellowAccent,fontSize: 15)),
            onPressed: () {
              database.child("video").set("start");

            },
          ),
    )
    );
  }
}
