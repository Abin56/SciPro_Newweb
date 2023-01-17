

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/faculties/faculties_screen.dart';
import 'package:lepton_sci_web/main_screens/rcorded_classes.dart';

import '../login/sign_in_screen.dart';


class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen({Key? key}) : super(key: key);

  @override
  State<FacultyHomeScreen> createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     FacultyScreen(),
    const Login(),
   // const LiveClasses(),
    const RecordedClasses()
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
            label: 'SciPRO',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.lock_clock),
            label: 'Chat',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.person_outline),
            label: 'History',
          ),

          BottomNavigationBarItem(icon:
          Icon(Icons.settings_outlined),
            label: 'Favourites',
          ),
        ],),
    );
  }
}
