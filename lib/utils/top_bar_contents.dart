import 'package:flutter/material.dart';
import 'package:lepton_sci_web/ADS_books/Add_ads.dart';
import 'package:lepton_sci_web/App_loginUsers/login_users.dart';
import 'package:lepton_sci_web/recorded_section/reco_section_screen.dart';
import 'package:lepton_sci_web/study_material_section/ForLive/upload.dart';
import 'package:lepton_sci_web/study_material_section/all_S_M_category.dart';
import 'package:lepton_sci_web/study_material_section/list_of_S-material.dart';

import '../login/sign_in_screen.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.red.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Image.asset(
                  "assets/images/SCIPRO.png",
                  height: 50,
                  width: 100,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 30),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return AllAppLoginUSERS();
                                  //   },
                                  // ));
                                },
                                child: Text(
                                  '+91 9048900024',
                                  style: TextStyle(
                                    color: _isHovering[0]
                                        ? Colors.blue.shade200
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 50),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                color: Colors.red,
                              ),
                              Text(
                                'info@scipro.in',
                                style: TextStyle(
                                  color: _isHovering[1]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: _isHovering[2] ? Colors.white : Colors.red,
                      fontSize: screenSize.width * 1 / 60),
                ),
              ),
              SizedBox(
                width: screenSize.width / 15,
              ),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/frdd.png",
                    height: 20,
                    width: 20,
                  )),
              SizedBox(
                width: screenSize.width * 1 / 70,
              ),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/utube.png",
                    height: 20,
                    width: 20,
                  )),
              SizedBox(
                width: screenSize.width * 1 / 70,
              ),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/instag.png",
                    height: 20,
                    width: 20,
                  )),
              SizedBox(
                width: screenSize.width * 1 / 70,
              ),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/twitt.png",
                    height: 20,
                    width: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
