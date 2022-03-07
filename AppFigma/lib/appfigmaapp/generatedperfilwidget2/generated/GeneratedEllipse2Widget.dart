import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedperfilwidget2/generated/GeneratedPerfil2Widget.dart';
import 'package:flutterapp/helpers/mask/mask.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Ellipse Ellipse 2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedEllipse2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Mask.fromSVGPath(
      'M82.5 45.5056C82.5 70.6377 64.0317 91.0112 41.25 91.0112C18.4683 91.0112 0 70.6377 0 45.5056C0 20.3736 18.4683 0 41.25 0C64.0317 0 82.5 20.3736 82.5 45.5056Z',
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
                final double width = constraints.maxWidth * 1.0888889197147253;

                final double height =
                    constraints.maxHeight * 1.2086420481675617;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * -0.08888889659534802,
                      y: constraints.maxHeight * -0.20876544468348793,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedPerfil2Widget(),
                      ))
                ]);
              }),
            )
          ]),
      offset: Offset(0.0, 0.0),
    );
  }
}
