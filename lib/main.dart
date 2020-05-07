import 'package:flutter/material.dart';
import 'package:flutter_06/文件夹/douban/douban_tool/mainPage.dart';

main()=> runApp(myApp());

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            highlightColor: Colors.transparent
        ),
        home: FXHomeMainPage()
    );
  }
}

