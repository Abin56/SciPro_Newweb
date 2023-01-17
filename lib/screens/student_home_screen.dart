

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/screens/student_screen.dart';

import '../main_screens/rcorded_classes.dart';
import '../main_screens/upcoming_classes.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const StudentScreen(),
    const UpcomingClasses(),
    const RecordedClasses(),
    //const LiveClasses()
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF49a9f8),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon:
            Icon(Icons.comment_bank),
            label: 'Home',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.lock_clock),
            label: 'Profile',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.person_outline),
            label: 'Live Classes',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.settings_outlined),
            label: 'Recorded Classes',
          ),
        ],),
    );
  }
}




