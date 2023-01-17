import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("SciPRO",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,),)
      ),
      body: SingleChildScrollView(
        child:

            Center(
              child:
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height*0.3),
                    width: screenSize.width*0.25,
                    height: 50,
                    color: Colors.blue,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,'/create_faculty_profile');
                      },
                      child: Container(
                      child: const Center(
                          child:
                          Text("Faculty Sign UP",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,),)
                      ),
                    ),
                  ),
              ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,'/create_student_profile');
                    },
                    child:
                  Container(
                    //margin: EdgeInsets.only(top: screenSize.height*0.3),
                    width: screenSize.width*0.25,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                        child:
                        Text("Students Sign UP",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,),)
                    ),
                  ),
                  )
                ],
              ),
            )
      )
    );

  }
}
