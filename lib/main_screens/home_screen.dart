import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lepton_sci_web/utils/top_bar_contents.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:path_provider/path_provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Login_signup/admin_login_page.dart';

import '../book_section/sciPro-ad.dart';
import '../screens_new/current_courses_mainpage.dart';
import '../screens_new/industry_oriented_final.dart';
import '../screens_new/our_popular_courses.dart';
import '../utils/app_colors.dart';
import '../utils/explore_drawer.dart';
import '../utils/floating_quick_access_bar.dart';
import '../utils/responsive.dart';
import '../widgets/bottom_bar.dart';
import 'admin_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
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

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  final Uri _faceBookUrl = Uri.parse('https://www.facebook.com/scipro.in');
  final Uri _twitterUrl = Uri.parse('https://twitter.com/SCIPRO_in');
  final Uri _utubeUrl = Uri.parse('https://www.instagram.com/scipro_in/');
  final Uri _instaUrl =
      Uri.parse('https://www.youtube.com/channel/UCDyXvapt2hsatw6RhRLhoOQ');
  final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

  Future<void> _launchFacebookUrl() async {
    if (!await launchUrl(_faceBookUrl)) {
      throw 'Could not launch $_faceBookUrl';
    }
  }

  Future<void> _launchTwitterUrl() async {
    if (!await launchUrl(_twitterUrl)) {
      throw 'Could not launch $_twitterUrl';
    }
  }

  Future<void> _launchyouTubeUrl() async {
    if (!await launchUrl(_utubeUrl)) {
      throw 'Could not launch $_utubeUrl';
    }
  }

  Future<void> _launchInstaUrl() async {
    if (!await launchUrl(_instaUrl)) {
      throw 'Could not launch $_instaUrl';
    }
  }

  Future<void> _launchleptonUrl() async {
    if (!await launchUrl(_leptonUrl)) {
      throw 'Could not launch $_leptonUrl';
    }
  }

  final Uri _url =
      Uri.parse('https://storage.googleapis.com/scipro-bucket/app-release.apk');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  //final Uri toLaunch =
  //Uri(scheme: 'https', host: '//console.firebase.google.com/project/lepton-scipro-91560/storage/lepton-scipro-91560.appspot.com/files/~2F7cimOoRYnkT8r4G3e3TEApFiHct1', path: '');
  //Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.width * 0.60
        ? _scrollPosition / (screenSize.width * 0.60)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Image.asset(
                "assets/images/scipro.png",
                height: screenSize.width * 1 / 20,
                width: screenSize.width * 1 / 8,
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.black87,
          child: Column(children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: SizedBox(
                        height: screenSize.height * 0.85,
                        width: screenSize.width,
                        child: Image.asset(
                          'assets/images/main1gopikafinal.jpg',
                          width: screenSize.width,
                          fit: BoxFit.cover,
                          //height: screenSize.height * 0.8 ,
                          //width: screenSize.width,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return SciproAdd();
                          },
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenSize.width - screenSize.width * 0.3,
                            top: 100),
                        child: Image.asset(
                          'assets/images/Adv1.png',
                          width: screenSize.width / 2,
                          //height: screenSize.height*0.7 ,
                          //width: screenSize.width,
                        ),
                      ),
                    ),
                    //Container(
                    // margin: EdgeInsets.only(
                    //  top: screenSize.height*1/6,
                    // left: screenSize.width*1/3.25),
                    // child:

                    ResponsiveWidget.isSmallScreen(context)
                        ? Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.only(
                                top: screenSize.height * 1 / 6,
                                left: screenSize.width * 1 / 6),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Your Dream",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.height * 1 / 30),
                                    ),
                                    Text(
                                      " JOB",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: screenSize.height * 1 / 30),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Is closer than",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.height * 1 / 30),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "You ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.height * 1 / 30),
                                    ),
                                    Text(
                                      " THINK",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: screenSize.height * 1 / 30),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.only(
                                top: screenSize.height * 1 / 4.5,
                                left: screenSize.width * 1 / 3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Your Dream",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.width * 1 / 50),
                                    ),
                                    Text(
                                      " JOB",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: screenSize.width * 1 / 50),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Is closer than",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.width * 1 / 50),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "You ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenSize.width * 1 / 50),
                                    ),
                                    Text(
                                      " THINK",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: screenSize.width * 1 / 40),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                    //),
                    Column(
                      children: [
                        FloatingQuickAccessBar(screenSize: screenSize),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Center(child: OurPopularCourses()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IndustryOrientedFinal(),
            ),
            CurrentCoursesMainPage(),
            SizedBox(height: screenSize.height / 10),
            Container(
                color: Color(0xff29293f),
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width * 1 / 3 - 25,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Container(
                            // height: screenSize.height*1/2,
                            // color: Color (0xff29293f),
                            //width: screenSize.width*1/3-25,
                            //padding: EdgeInsets.all(screenSize.width*1/100),
                            //child:
                            // Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            //children: [
                            Center(
                              child: Text("SCIPRO",
                                  style: TextStyle(
                                      fontSize: screenSize.width * 1 / 50,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: screenSize.width * 1 / 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                  "We, the team scipro are well experienced professionals in research as well as education in various domains.\n"
                                  "As we have gone through different phases of education, we know how difficult to get into our dream\n"
                                  "position and what are the different steps we must go through.\n"
                                  "We provide courses for various competitive examinations, courses for advanced technologies that\n"
                                  "ensure a smooth landing in your dream runway.\n"
                                  "Our directors &amp; faculties have PhD in various subjects, India and abroad research experiences,\n"
                                  " published many papers in many international publications.\n"
                                  "Some of our team members have reputable certifications in information security and advanced \n"
                                  "technologies Our vision &amp; mission is, all the students have to get job or placed in suitable\n"
                                  " positions with lesserspending in education and we guide them to get through their dream journey\n"
                                  "with minimum cost.\n",
                                  style: TextStyle(
                                      fontSize: screenSize.height * 1 / 50,
                                      color: Colors.white)),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width * 1 / 30,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchFacebookUrl();
                                      },
                                      child: CircleAvatar(
                                        radius: screenSize.width * 1 / 60,
                                        backgroundColor: Color(0xFF1493d2),
                                        child: Image.asset(
                                          "assets/images/frdd.png",
                                          height: screenSize.width * 1 / 50,
                                          width: screenSize.width * 1 / 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 1 / 60,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchyouTubeUrl();
                                      },
                                      child: CircleAvatar(
                                        radius: screenSize.width * 1 / 60,
                                        backgroundColor: Color(0xFF1493d2),
                                        child: Image.asset(
                                          "assets/images/instag.png",
                                          height: screenSize.width * 1 / 50,
                                          width: screenSize.width * 1 / 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 1 / 60,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchTwitterUrl();
                                      },
                                      child: CircleAvatar(
                                        radius: screenSize.width * 1 / 60,
                                        backgroundColor: Color(0xFF1493d2),
                                        child: Image.asset(
                                          "assets/images/twitt.png",
                                          height: screenSize.width * 1 / 50,
                                          width: screenSize.width * 1 / 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 1 / 60,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchInstaUrl();
                                      },
                                      child: CircleAvatar(
                                        radius: screenSize.width * 1 / 60,
                                        backgroundColor:
                                            const Color(0xFF1493d2),
                                        child: Image.asset(
                                          "assets/images/utube.png",
                                          height: screenSize.width * 1 / 50,
                                          width: screenSize.width * 1 / 50,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                    // ),
                    //]),
                    Container(
                      width: screenSize.width * 1 / 3,
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/terms_condition');
                                        },
                                        child: Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Home",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Upcoming Courses",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Recorded Courses",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Live Courses",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/terms_condition');
                                        },
                                        child: Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Privacy Policy",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/terms_condition');
                                        },
                                        child: Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Terms & Conditions",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/terms_condition');
                                        },
                                        child: Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("Cancellation Policy",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(screenSize.width * 1 / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/terms_condition');
                                        },
                                        child: Container(
                                            color: const Color(0xff29293f),
                                            width: screenSize.width * 1 / 12,
                                            child: Text("White Board",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        1 /
                                                        100,
                                                    color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    Container(
                      //alignment: Alignment.topLeft,
                      color: const Color(0xff29293f),
                      width: screenSize.width * 1 / 3,
                      child: Column(children: [
                        SizedBox(
                          width: screenSize.width * 1 / 30,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: screenSize.width * 1 / 30,
                            ),
                            Container(
                              child: Text(
                                "Vectorwind-tech systems pvt.ltd",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.width * 1 / 90),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Image.asset(
                              "assets/images/vectorwindfinal.png",
                              height: screenSize.width * 1 / 5,
                              width: screenSize.width * 1 / 5,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Icon(Icons.email),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Container(
                              child: Text(
                                "Email:",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Text("info@scipro.in",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white))
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 1 / 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Icon(Icons.phone),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Container(
                              child: Text(
                                "Phone:",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Text("+91 90489 00024",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white))
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 1 / 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Icon(Icons.home),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Container(
                              child: Text(
                                "Address:",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * 1 / 70,
                            ),
                            Text(
                                "Vectorwind-tech systems pvt.ltd\n"
                                "Door no.4/461, 2nd floor\n"
                                "Suite# 151, Valamkottil towers\n"
                                "Judgemukku, Thrikkakara p.o\n"
                                "Kochi 682021\n"
                                "India\n",
                                style: TextStyle(
                                    fontSize: screenSize.width * 1 / 100,
                                    color: Colors.white))
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 1 / 30,
                        ),
                      ]),
                    ),
                  ],
                )),
            Container(
              color: Colors.black,
              width: screenSize.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: screenSize.width * 1 / 20,
                  ),
                  Text(
                    "Copyright",
                    style: TextStyle(
                        fontSize: screenSize.width * 1 / 110,
                        color: Colors.white),
                  ),
                  Image.asset(
                    "assets/images/cright.png",
                    height: screenSize.height * 0.05,
                    width: screenSize.width * 0.05,
                  ),
                  Container(
                    child: Text(
                        "All Rights Reserved | by Vectorwind-Tech Systems Pvt.Ltd ",
                        style: TextStyle(
                            fontSize: screenSize.width * 1 / 90,
                            color: Colors.white)),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Developed by",
                    style: TextStyle(
                        fontSize: screenSize.width * 1 / 100,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      _launchleptonUrl();
                    },
                    child: Image.asset(
                      "assets/images/Lepton.png",
                      height: screenSize.height * .05,
                      width: screenSize.width * .05,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;

    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ));

    final raf = file.openSync(mode: FileMode.write);
    await raf.close();

    return file;
  }
}
