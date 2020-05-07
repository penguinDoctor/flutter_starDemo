import 'package:flutter/material.dart';

import 'package:flutter_06/文件夹/douban/douban_tool/bottomNavigation.dart';
import 'package:flutter_06/文件夹/douban/douban_tool/pages.dart';

class  FXHomeMainPage extends StatefulWidget {
  @override
  _FXHomeMainPageState createState() => _FXHomeMainPageState();
}

class _FXHomeMainPageState extends State<FXHomeMainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          highlightColor: Colors.transparent
      ),
      home: Scaffold(
        body: FXMainPage(this.currentIndex) ,
        bottomNavigationBar: BottomNavigationBar(items:items(),
          currentIndex: this.currentIndex,
          type:BottomNavigationBarType.fixed ,
          onTap: (index){
            setState(() {
              this.currentIndex = index;
            });

          },
        ),
      ),
    );
  }
}

class FXMainPage extends StatefulWidget {

  int currentIndex;
  FXMainPage(this.currentIndex);
  @override
  _FXMainPageState createState() => _FXMainPageState();
}

class _FXMainPageState extends State<FXMainPage> {
  @override
  Widget build(BuildContext context) {
    return  FXPages(widget.currentIndex);
  }
}
