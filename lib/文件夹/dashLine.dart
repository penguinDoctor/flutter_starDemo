import 'package:flutter/material.dart';
class FXHomeDashedPage extends StatelessWidget {
  final Axis direction;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  FXHomeDashedPage(
      {this.direction = Axis.horizontal, //默认是水平方向
        this.dashedWidth = 1,
        this.dashedHeight = 1,
        this.count = 10,
        this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: this.direction,
          children: List.generate(count, (_) {
            return SizedBox(
                width: dashedWidth,
                height: dashedHeight,
                child: DecoratedBox(decoration: BoxDecoration(color: color)));
          }),
        ),
      ),
    );
  }
}
