import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingClasses extends StatefulWidget {
  const UpcomingClasses({Key? key}) : super(key: key);

  @override
  State<UpcomingClasses> createState() => _UpcommingClassesState();
}

class _UpcommingClassesState extends State<UpcomingClasses> {
  @override
  Widget build(BuildContext context) {
    return Center(child:
    Container(child:
    Text("Upadte Soon",style: TextStyle(color: Colors.cyanAccent,fontSize: 20),)
    ));
  }
}
