import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/appfigmaapp/generatedimgtembasewidget5/generated/GeneratedVectorWidget62.dart';

/* Frame thermometer
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedThermometerWidget5 extends StatelessWidget {
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
                  double percentWidth = 0.4374994277954102;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 8.749988555908203;

                  double percentHeight = 0.9374151229858398;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      18.748302459716797;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.2812499046325684,
                        translateY:
                            constraints.maxHeight * 0.031334754824638364,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: GeneratedVectorWidget62())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
