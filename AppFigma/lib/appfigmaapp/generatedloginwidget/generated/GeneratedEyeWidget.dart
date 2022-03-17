import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedloginwidget/generated/GeneratedVectorWidget1.dart';
import 'package:flutterapp/appfigmaapp/generatedloginwidget/generated/GeneratedVectorWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Frame eye
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedEyeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 20.0,
        height: 20.0,
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
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.25;
                  double scaleX = (constraints.maxWidth * percentWidth) / 5.0;

                  double percentHeight = 0.25;
                  double scaleY = (constraints.maxHeight * percentHeight) / 5.0;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.375,
                        translateY: constraints.maxHeight * 0.375,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: GeneratedVectorWidget())
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
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.9375068664550781;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      18.750137329101562;

                  double percentHeight = 0.625;
                  double scaleY =
                      (constraints.maxHeight * percentHeight) / 12.5;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.031211048364639282,
                        translateY: constraints.maxHeight * 0.1875,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: GeneratedVectorWidget1())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}