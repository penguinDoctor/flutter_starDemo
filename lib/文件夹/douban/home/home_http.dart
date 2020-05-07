
import 'package:flutter_06/文件夹/douban/douban_tool/http_config.dart';
import 'package:flutter_06/文件夹/douban/douban_tool/service.dart';
import 'package:flutter_06/文件夹/douban/model/home_model.dart';
class FXHomeHtttp{

  static Future<List<MovieItem>>  requestHttp() async{

    print("来到这里===");
       final result =  await Service.request(HomeConfig.movieUrl);
       final subject = result["subjects"];
       List<MovieItem> movies = [];
       for(var sub in subject){
         movies.add(MovieItem.fromMap(sub));
       }
       return movies;
  }
}