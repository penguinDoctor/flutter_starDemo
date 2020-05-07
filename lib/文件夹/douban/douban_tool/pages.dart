import 'package:flutter/material.dart';
import 'package:flutter_06/文件夹/douban/home/home.dart';
import 'package:flutter_06/文件夹/douban/subject/subject.dart';
class FXPages extends StatefulWidget {

  int currentInex =0;
  FXPages(this.currentInex);
  @override
  _FXPagesState createState() => _FXPagesState();
}

class _FXPagesState extends State<FXPages> {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children:pages(),
      index: widget.currentInex,
    );
  }
}

List<Widget> pages() {
  return [
    FXHomePage(),
    FXSubjectPage(),
    FXSubjectPage(),
    FXSubjectPage(),
    FXSubjectPage(),
  ];
}
