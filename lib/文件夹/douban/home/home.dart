
import 'package:flutter/material.dart';
import 'package:flutter_06/文件夹/douban/home/home_http.dart';
import 'package:flutter_06/文件夹/douban/model/home_model.dart';
import 'package:flutter_06/文件夹/douban/home/home_page_item.dart';

main() {
  runApp(FXHomePage());
}

class FXHomePage extends StatefulWidget {
  @override
  _FXHomePageState createState() => _FXHomePageState();
}

//https://douban.uieee.com/v2/movie/top250?start=0&count=20
class _FXHomePageState extends State<FXHomePage> {

  List<MovieItem> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    //网络请求
    FXHomeHtttp.requestHttp().then((items){
      setState(() {
        movies.addAll(items);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title:Text("首页")),
        body: ListView.builder(itemBuilder: (context,index){

          return FXHomeMovieItem(movies[index]);
        },
          itemCount: movies.length,
        )
      ),
    );
  }
}
