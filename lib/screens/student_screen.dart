import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../joinedcourses.dart';
import '../services/auth_methods.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final AuthMethods _authMethods = AuthMethods();
  //late TextEditingController nameController;
  late String nameController;

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  int _current = 0;
  int _currentIndex = 0;
  int _sub = 0;

  final List<String> imagesList = [
    'assets/images/divya.png',
    'assets/images/gokul.png',
    'assets/images/praveena.png',
    'assets/images/rekha.png',
    'assets/images/sunil.png',
  ];
  final List<String> titles = [
    'Dr. Divya P.S',
    'Gokul S',
    'Praveena T.P',
    'Dr. Rekha Mol K.R',
    'Sunil P'
  ];
  final List<String> subtitles = [
    'Microbiologist',
    'Technologist',
    'Physicist',
    'Biotechnologist',
    'IT Security Consultant',
  ];
  final List<String> courseImagesList = [
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.jpg',
  ];

  List<Widget> generateImagesTiles() {
    return imagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  List<Widget> generateCoursesImagesTiles() {
    return courseImagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  _scrollListner() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListner);
    nameController = _authMethods.user.displayName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.9),
                      AppColor.gradientSecond
                    ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight,
                  )),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/SCIPRO.png",
                          width: 100,
                          height: 120,
                        ),
                        const Text(
                          "The Science Professional",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        const Text(
                          "Hi ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          nameController,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "!",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      text: 'Start your journy..to grab your Job',
                      onPressed: () async {
                    
                      }),
                ],
              ),
            ),
          ]),
          JoinedCourses(),
          SizedBox(
            height: 20.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "Our Faculties",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ]),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Stack(
              children: [
                CarouselSlider(
                    items: generateImagesTiles(),
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 18 / 8,
                        onPageChanged: (index, other) {
                          setState(() {
                            _current = index;
                          });
                        })),
                const AspectRatio(
                  aspectRatio: 18 / 8,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${titles[_current]}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.black45,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${subtitles[_current]}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.black45,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index1 = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index1
                      ? Color.fromRGBO(0, 0, 0, 0.8)
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          ),
          //LiveClasses(),
          //SizedBox(height: 20.0,),
          //RecordedClasses(),
          //SizedBox(height: 10.0,),
          //UpcomingCourses()
        ],
      ),
    );
  }
}
