import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/mask/mask.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/appfigmaapp/generatedbannerwidget1/generated/GeneratedPerfil2Widget1.dart';

/* Ellipse Ellipse 2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedEllipse2Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Mask.fromSVGPath(
      'M90 45.5056C90 70.6377 69.8528 91.0112 45 91.0112C20.1472 91.0112 0 70.6377 0 45.5056C0 20.3736 20.1472 0 45 0C69.8528 0 90 20.3736 90 45.5056Z',
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
                final double width = constraints.maxWidth * 1.0888888888888888;

                final double height =
                    constraints.maxHeight * 1.2086419468481289;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * -0.08888888888888889,
                      y: constraints.maxHeight * -0.20876542718285862,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedPerfil2Widget1(),
                      ))
                ]);
              }),
            )
          ]),
      offset: Offset(0.0, 0.0),
    );
  }
}
