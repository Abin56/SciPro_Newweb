import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    double _scrollPosition = 0;
    double _opacity = 0;

    var screenSize = MediaQuery
        .of(context)
        .size;
    _opacity = _scrollPosition < screenSize.height * 0.70
        ? _scrollPosition / (screenSize.height * 0.70)
        : 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace:
          Container
            (
            height: 70,
            width: screenSize.width,
            color: Color (0xFF0eb8ff),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(width: 100,),
                Image.asset("assets/images/SCIPRO.png",height: 40,),
                SizedBox(width: screenSize.width*0.3),

                Container(child: Text("Contact Us",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),

                Expanded(child: Container()),
                TextButton(onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                }, child: const Text("",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),),),
              ],
            ),

          )
      ),
      body: Center(
          child:Container(
            alignment: Alignment.center,
            color: const Color (0xff29293f),
            width: screenSize.width*1/3,
            child: Column(
                children:[
                  SizedBox(width: screenSize.width*1/30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: screenSize.width*1/30,),
                      Container(
                        child: Text("Vectorwind-tech systems pvt.ltd",style:
                        TextStyle(color: Colors.white,fontSize: screenSize.width*1/90 ),),
                      ),
                      SizedBox(width: screenSize.width*1/70,),
                      Image.asset("assets/images/vector.png",
                        height:screenSize.width*1/15,
                        width: screenSize.width*1/15,)
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: screenSize.width*1/70,),
                      Icon(Icons.email),
                      SizedBox(width: screenSize.width*1/70,),
                      Container(
                        child: Text("Email:", style: TextStyle(fontSize: screenSize.width*1/100,
                            color: Colors.white),
                        ),),
                      SizedBox(width: screenSize.width*1/70,),
                      Text("info@scipro.in", style: TextStyle(fontSize: screenSize.width*1/100,
                          color: Colors.white)
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height*1/30,),
                  Row(
                    children: [
                      SizedBox(width: screenSize.width*1/70,),
                      Icon(Icons.phone),
                      SizedBox(width: screenSize.width*1/70,),
                      Container(
                        child: Text("Phone:", style: TextStyle(fontSize: screenSize.width*1/100,
                            color: Colors.white),
                        ),),
                      SizedBox(width: screenSize.width*1/70,),
                      Text("+91 90489 00024", style: TextStyle(fontSize: screenSize.width*1/100,
                          color: Colors.white)
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height*1/30,),
                  Row(
                    children: [
                      SizedBox(width: screenSize.width*1/70,),
                      Icon(Icons.home),
                      SizedBox(width: screenSize.width*1/70,),
                      Container(
                        child: Text("Address:", style: TextStyle(fontSize: screenSize.width*1/100,
                            color: Colors.white),
                        ),),
                      SizedBox(width: screenSize.width*1/70,),
                      Text("Vectorwind-tech systems pvt.ltd\n"
                          "Door no.4/461, 2nd floor\n"
                          "Suite# 151, Valamkottil towers\n"
                          "Judgemukku, Thrikkakara p.o\n"
                          "Kochi 682021\n"
                          "India\n", style: TextStyle(fontSize: screenSize.width*1/100,
                          color: Colors.white)
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height*1/30,),

                ]),
          ),
      ),
    );
  }
}




