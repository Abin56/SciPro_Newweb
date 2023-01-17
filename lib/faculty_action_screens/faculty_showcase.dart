import 'package:flutter/cupertino.dart';

import '../widgets/custom_button.dart';

class FacultyShowcase extends StatefulWidget {
  const FacultyShowcase({Key? key}) : super(key: key);

  @override
  State<FacultyShowcase> createState() => _FacultyShowcaseState();
}

class _FacultyShowcaseState extends State<FacultyShowcase> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
              width: screenSize.width*1/3,
              height: 100,
              child:CustomButton(
                  text: "Uploaded Documents",
                  onPressed: (){

                  })

          ),
          Container(
              width: screenSize.width*1/3,
              height: 100,
              child:CustomButton(
                  text: "My Live Classes",
                  onPressed: (){

                  })

          ),
          Container(
              width: screenSize.width*1/3,
              height: 100,
              child:CustomButton(
                  text: "My Recorded Classes",
                  onPressed: (){

                  })

          ),
        ],
      ),
    );
  }
}
