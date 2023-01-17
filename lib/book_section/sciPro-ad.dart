import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_container.dart';
import 'add_address.dart';


class SciproAdd extends StatelessWidget {
  ValueNotifier<bool> scrollNotifire = ValueNotifier(true);

  SciproAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("New Book Realeased")),
        body: ValueListenableBuilder(
          valueListenable: scrollNotifire,
          builder: (BuildContext context, index, _) {
            return SafeArea(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifire.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifire.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: SingleChildScrollView(
                              child: Center(
                            child: Container(
                                child: Column(
                              children: [
                                Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/rankfile.png?alt=media&token=886ff47f-7b08-4ef1-810d-e44c9c05711d"),
                                Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/mlt.jpg?alt=media&token=e3f28208-dd0f-4781-89e6-ae23fb408ce9"),
                              ],
                            )),
                          )),
                        ),
                      ],
                    ),
                    scrollNotifire.value == true
                        ? AnimatedContainer(
                            duration: Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 108,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/SCIPRO.png',
                                      height: 106,
                                      width: 200,
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return AddNewDeliveryAddress();
                                          },
                                        ));
                                      },
                                      child: ButtonContainerWidget(
                                        curving: 30,
                                        colorindex: 0,
                                        height: 50,
                                        width: 200,
                                        child: Center(
                                          child: Text(
                                            'Buy this Book',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 10,
                          )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
