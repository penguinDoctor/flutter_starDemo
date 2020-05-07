import 'package:flutter/material.dart';
import 'package:flutter_06/文件夹/douban/model/home_model.dart';
import 'package:flutter_06/文件夹/Widgets/star.dart';
import 'package:flutter_06/文件夹/Widgets/dashLine.dart';

class FXHomeMovieItem extends StatelessWidget {
  //255 238 105 144
  final MovieItem movie;

  FXHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeaderWidget(this.movie),
          buildContentWidget(this.movie),
          SizedBox(
            height: 10,
          ),
          buildBottomWidget(this.movie)
        ],
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD), width: 10)),
      ),
    );
  }
}

Widget buildHeaderWidget(MovieItem item) {
  return Container(
    padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
    child: Text(
      "No.${item.rank}",
      style: TextStyle(color: Color.fromARGB(255, 131, 95, 36), fontSize: 18),
    ),
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3)),
  );
}

Widget buildContentWidget(MovieItem item) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildImageWidget(item),
        SizedBox(
          width: 10,
        ),
        buildContentInfo(item),
        SizedBox(
          width: 10,
        ),
        buildContentDashLine(),
        SizedBox(
          width: 10,
        ),
        buildContentWish()
      ],
    ),
  );
}

Widget buildImageWidget(MovieItem item) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.network(item.imageURL, height: 150),
  );
}

Widget buildContentInfo(MovieItem item) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentInfoTitle(item),
        SizedBox(
          height: 10,
        ),
        buildContentInfoRating(item),
        SizedBox(
          height: 10,
        ),
        buildContentInfoDescribe(item)
      ],
    ),
  );
}

Widget buildContentInfoTitle(MovieItem item) {
  return Text.rich(TextSpan(children: [
    WidgetSpan(
        child: Icon(
      Icons.play_circle_outline,
      color: Colors.red,
      size: 24,
    )),
    WidgetSpan(
        child: SizedBox(
      width: 5,
    )),
    TextSpan(
        text: item.title, style: TextStyle(color: Colors.black, fontSize: 18)),
    WidgetSpan(
        child: SizedBox(
      width: 3,
    )),
    TextSpan(
        text: "(${item.playDate})",
        style: TextStyle(fontSize: 18, color: Colors.grey))
  ]));
}

Widget buildContentInfoRating(MovieItem item) {
  return Row(
    children: <Widget>[
      FXStarting(item.rating, Colors.red, 25),
      SizedBox(
        width: 3,
      ),
      Text(
        "${item.rating}",
        style: TextStyle(fontSize: 20),
      )
    ],
  );
}

Widget buildContentInfoDescribe(MovieItem item) {
  final genreString = item.genres.join(" ");
  final directorString = item.director.name;
  final actorString = item.casts.map((item) => item.name).toList().join(" ");
  return Text(
    "$genreString / $directorString / $actorString",
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget buildContentDashLine() {
  return Container(
    height: 120,
    child: FXHomeDashedPage(
      direction: Axis.vertical,
      dashedWidth: 1,
      dashedHeight: 6,
      color: Color(0xffe2e2e2),
    ),
  );
}

Widget buildContentWish() {
  //255 238 205 144

  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.home,
          color: Color.fromARGB(255, 238, 205, 144),
          size: 24,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "想看",
          style: TextStyle(
              color: Color.fromARGB(255, 238, 205, 144), fontSize: 20),
        )
      ],
    ),
  );
}

Widget buildBottomWidget(MovieItem item) {
  return Container(
    width: double.infinity,
    height: 50,
    padding: EdgeInsets.only(left: 10, top: 10),
    decoration: BoxDecoration(
        color: Color(0xffe2e2e2), borderRadius: BorderRadius.circular(6)),
    child: Text(
      item.originalTitle,
      style: TextStyle(color: Color(0xff666666), fontSize: 20),
    ),
  );
}
