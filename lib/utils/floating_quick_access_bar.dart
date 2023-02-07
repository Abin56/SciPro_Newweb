import 'package:flutter/material.dart';
import 'package:lepton_sci_web/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_screens/live_classes.dart';
import '../main_screens/rcorded_classes.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  final Uri _url = Uri.parse(
      "https://storage.googleapis.com/scipro-bucket/app-release%20(5).apk");
  Future<void> _launchUrl() async {e
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = [
    'Recorded Courses',
    'Live Courses',
    'Hybrid Courses',
    'Downloads'
  ];
  List<IconData> icons = [
    Icons.tv,
    Icons.laptop_chromebook_outlined,
    Icons.ad_units_sharp,
    Icons.description
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          if (i == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecordedClasses()));
          }
          if (i == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LiveClasses()));
          }
          if (i == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecordedClasses()));
          }
          if (i == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecordedClasses()));
          }
        },
        child: Text(
          items[i],
          style: TextStyle(
              color: _isHovering[i] ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          heightFactor: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.8,
              left: ResponsiveWidget.isSmallScreen(context)
                  ? widget.screenSize.width / 12
                  : widget.screenSize.width / 5,
              right: ResponsiveWidget.isSmallScreen(context)
                  ? widget.screenSize.width / 12
                  : widget.screenSize.width / 5,
            ),
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: [
                      Stack(children: [
                        Container(
                            margin: EdgeInsets.only(top: 30, left: 0),
                            alignment: Alignment.center,
                            width: screenSize.width * 1 / 2,
                            height: screenSize.width * 1 / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 1 / 30),
                                color: Colors.transparent),
                            child: InkWell(
                              onTap: () {
                                _launchUrl();
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(screenSize.width * 1 / 200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Click here to Download",
                                          style: TextStyle(
                                              fontSize:
                                                  screenSize.width * 1 / 50,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/SCIPRO.png",
                                              height: screenSize.width * 1 / 40,
                                              width: screenSize.width * 0.3,
                                            ),
                                            Text(
                                              "android App",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      50),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        "assets/images/androidicon1.gif",
                                        height: screenSize.width * 1 / 30,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 70, left: 0),
                            alignment: Alignment.center,
                            width: screenSize.width * 1 / 2,
                            height: screenSize.width * 1 / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 1 / 30),
                                color: Colors.transparent),
                            child: InkWell(
                              child: Padding(
                                padding:
                                    EdgeInsets.all(screenSize.width * 1 / 200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Releasing soon....",
                                          style: TextStyle(
                                              fontSize:
                                                  screenSize.width * 1 / 50,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/SCIPRO.png",
                                              height: screenSize.width * 1 / 40,
                                              width: screenSize.width * 0.3,
                                            ),
                                            Text(
                                              "iOS App",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      50),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/images/ioswhite.png",
                                      width: screenSize.width * 1 / 12,
                                      height: screenSize.width * 1 / 25,
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ]),
                      ...Iterable<int>.generate(items.length).map(
                        (int pageIndex) => Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: widget.screenSize.height / 45,
                                  bottom: widget.screenSize.height / 45,
                                  left: widget.screenSize.width / 20),
                              child: Row(
                                children: [
                                  Icon(
                                    icons[pageIndex],
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: widget.screenSize.width / 20),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {
                                      if (pageIndex == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RecordedClasses()));
                                      }
                                      if (pageIndex == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LiveClasses()));
                                      }
                                      if (pageIndex == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RecordedClasses()));
                                      }
                                      if (pageIndex == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RecordedClasses()));
                                      }
                                    },
                                    child: Text(
                                      items[pageIndex],
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Stack(children: [
                        Container(
                            margin: EdgeInsets.only(top: 35, left: 0),
                            alignment: Alignment.center,
                            width: screenSize.width * 1 / 2.25,
                            height: screenSize.width * 1 / 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 1 / 30),
                                color: Colors.transparent),
                            child: InkWell(
                              onTap: () {
                                _launchUrl();
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(screenSize.width * 1 / 200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Click here to Download",
                                          style: TextStyle(
                                              fontSize:
                                                  screenSize.width * 1 / 70,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/SCIPRO.png",
                                              height: screenSize.width * 1 / 50,
                                              width: screenSize.width * 0.3,
                                            ),
                                            Text(
                                              "android App",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      70),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        "assets/images/androidicon1.gif",
                                        height: screenSize.width * 1 / 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 110, left: 0),
                            alignment: Alignment.center,
                            width: screenSize.width * 1 / 2.25,
                            height: screenSize.width * 1 / 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 1 / 30),
                                color: Colors.transparent),
                            child: InkWell(
                              child: Padding(
                                padding:
                                    EdgeInsets.all(screenSize.width * 1 / 200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Releasing soon....",
                                          style: TextStyle(
                                              fontSize:
                                                  screenSize.width * 1 / 70,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/SCIPRO.png",
                                              height: screenSize.width * 1 / 50,
                                              width: screenSize.width * 0.3,
                                            ),
                                            Text(
                                              "iOS App",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      60),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/images/ioswhite.png",
                                      width: screenSize.width * 1 / 15,
                                      height: screenSize.width * 1 / 30,
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ]),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: widget.screenSize.height / 50,
                            bottom: widget.screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: generateRowElements(),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
