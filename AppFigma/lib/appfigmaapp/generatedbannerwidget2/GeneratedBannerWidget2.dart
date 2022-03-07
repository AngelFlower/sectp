import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedbannerwidget2/generated/GeneratedMaskgroupWidget5.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/appfigmaapp/generatedbannerwidget2/generated/Generated59169813_1011Widget2.dart';

/* Instance Banner
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedBannerWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: 360.0,
      height: 150.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: Generated59169813_1011Widget2(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.25;

                final double height =
                    constraints.maxHeight * 0.6067415873209635;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.09166666666666666,
                      y: constraints.maxHeight * 0.7,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedMaskgroupWidget5(),
                      ))
                ]);
              }),
            )
          ]),
    ));
  }
}
