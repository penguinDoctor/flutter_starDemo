
import 'package:flutter/material.dart';

//封装评分
class FXStarting extends StatefulWidget {
  @override
  _FXStartingState createState() => _FXStartingState(rating: 3.5);
}

class _FXStartingState extends State<FXStarting> {
  //评分
  double rating;
  //总分
  double totalRating;
  //  总的个数
  int count;
  //未选中的颜色
  Color unselectColor;
  //选中的颜色
  Color selectColor;
  double size;

  Widget unselectImage;
  Widget selectImage;

  _FXStartingState(
      {@required this.rating,
        this.totalRating = 10,
        this.count = 5,
        this.unselectColor = const Color(0xFFBBBBBB),
        this.selectColor = const Color(0XFFFF0000),
        this.size = 50,
        Widget unselectImage,
        Widget selectImage})
      : unselectImage = unselectImage ??
      Icon(
        Icons.star_border,
        color: const Color(0XFFBBBBBB),
        size: size,
      ),
        selectImage = selectImage ??
            Icon(
              Icons.star,
              color: selectColor,
              size: size,
            );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: buildUnselectState(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: buildSelectState(),
          ),
        ],
      ),
    );
  }

  List<Widget> buildUnselectState() {
    List<Widget> list = [];
    for (var i = 0; i < count; i++) {
      list.add(this.unselectImage);
    }
    return list;
  }

  List<Widget> buildSelectState() {
    List<Widget> list = [];

    double oneValue = this.totalRating / this.count;
    int entireCount = (this.rating / oneValue).floor();
    double leftCountWidth =
        ((this.rating / oneValue) - entireCount) * this.size;

    for (var i = 0; i < entireCount; i++) {
      list.add(this.selectImage);
    }

    Widget half = ClipRect(
      clipper: FXStarClip(leftCountWidth),
      child: this.selectImage,
    );

    list.add(half);

    return list;
  }
}

class FXStarClip extends CustomClipper<Rect> {
  double clipWidth;

  FXStarClip(this.clipWidth);

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    print(clipWidth);
    return Rect.fromLTRB(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
