import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/appfigmaapp/generatedperfilwidget2/generated/GeneratedVectorWidget32.dart';
import 'package:flutterapp/appfigmaapp/generatedperfilwidget2/generated/GeneratedVectorWidget33.dart';
import 'package:flutterapp/appfigmaapp/generatedperfilwidget2/generated/GeneratedVectorWidget31.dart';

/* Frame ellipsis-vertical
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedEllipsisverticalWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedDropDownWidget'),
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
          width: 23.8431396484375,
          height: 19.33333396911621,
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
                    double percentWidth = 0.1875;
                    double scaleX = (constraints.maxWidth * percentWidth) /
                        4.470588684082031;

                    double percentHeight = 0.18749999383400245;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 3.625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.40625,
                          translateY:
                              constraints.maxHeight * 0.40625000308299875,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: GeneratedVectorWidget31())
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
                    double percentWidth = 0.1875;
                    double scaleX = (constraints.maxWidth * percentWidth) /
                        4.470588684082031;

                    double percentHeight = 0.18749999383400245;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 3.625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.40625,
                          translateY:
                              constraints.maxHeight * 0.7187500092489963,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: GeneratedVectorWidget32())
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
                    double percentWidth = 0.1875;
                    double scaleX = (constraints.maxWidth * percentWidth) /
                        4.470588684082031;

                    double percentHeight = 0.18749999383400245;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 3.625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.40625,
                          translateY:
                              constraints.maxHeight * 0.0937499907510037,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: GeneratedVectorWidget33())
                    ]);
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
