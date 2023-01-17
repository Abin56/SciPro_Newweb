import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth_service.dart';
import '../course_list.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  String name = "";


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            title: Card(
              color: Colors.black,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
      body:
          Container(
            margin: EdgeInsets.only(top: 10),
                            child:
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('users').snapshots(),
                                  builder: (context, snapshots) {
                                    return (snapshots.connectionState == ConnectionState.waiting)
                                        ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                        : ListView.builder(
                                        itemCount: snapshots.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          var data = snapshots.data!.docs[index].data()
                                          as Map<String, dynamic>;

                                          if (name.isEmpty) {
                                            return ListTile(
                                              title: Text(
                                                data['username'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                data['uid'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(data['profilePhoto']),
                                              ),
                                            );
                                          }
                                          if (data['name']
                                              .toString()
                                              .toLowerCase()
                                              .startsWith(name.toLowerCase())) {
                                            return ListTile(
                                              title: Text(
                                                data['username'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                data['uid'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(data['profilePhoto'].toString()),
                                              ),
                                            );
                                          }
                                          return Container();
                                        });
                                  },
                                ),
                             ),

    );
  }
}
