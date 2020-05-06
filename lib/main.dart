import 'package:flutter/material.dart';
import 'package:flutter_06/文件夹/star.dart';
main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter项目实战")),
        body:FXStarting(),
      ),
    );
  }
}

