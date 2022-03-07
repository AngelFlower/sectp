import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/svg/svg.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Vector Line 1
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedLine1Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: TransformHelper.rotate(
          a: 1.00,
          b: 0.00,
          c: -0.00,
          d: 1.00,
          child: Container(
            width: 304.00042724609375,
            height: 0.0,
            child: SvgWidget(painters: [
              SvgPathPainter.stroke(
                1.0,
                strokeJoin: StrokeJoin.miter,
              )
                ..addPath('M0 0.5L304 0.5L304 -0.5L0 -0.5L0 0.5Z')
                ..color = Color.fromARGB(255, 162, 162, 162),
            ]),
          )),
    );
  }
}
