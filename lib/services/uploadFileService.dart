import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UolpadFileServer extends StatefulWidget {
  const UolpadFileServer({Key? key}) : super(key: key);

  @override
  State<UolpadFileServer> createState() => _UolpadFileServerState();
}

class _UolpadFileServerState extends State<UolpadFileServer> {

  void getHTTP () async {
    var response = await Dio().get("https://google.com");
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("hi"),
      ),
        body:
        Column(
          children: [
            Center(child:
            InkWell(
              onTap: getHTTP,
                child: Container(
                  width: 100,
                  height: 50,
                  child: Text("Upload"),
    )
    )
    ),
          ],
        )
    );
  }
}
