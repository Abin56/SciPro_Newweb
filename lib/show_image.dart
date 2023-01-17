import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/services/firestore_database.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Image"),
      ),
      body: FutureBuilder(
        future:    FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Image.network(
                  snapshot.data.toString(),
                ),
                Text(snapshot.data.toString(),style: TextStyle(fontSize: 20,color: Colors.red),)
              ],
            );

          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}