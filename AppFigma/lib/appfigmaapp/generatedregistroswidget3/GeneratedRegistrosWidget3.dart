import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/generated/GeneratedImgTemBaseWidget4.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/generated/GeneratedImgTemBaseWidget2.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/generated/GeneratedMenuInferiorWidget3.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/generated/GeneratedMenudeRegistroWidget2.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/generated/GeneratedImgTemBaseWidget3.dart';

/* Frame Registros
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedRegistrosWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 360.0,
        height: 640.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: Color.fromARGB(255, 239, 235, 235),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 570.0,
                right: null,
                bottom: null,
                width: 360.0,
                height: 70.0,
                child: GeneratedMenuInferiorWidget3(),
              ),
              Positioned(
                left: 30.0,
                top: 82.0,
                right: null,
                bottom: null,
                width: 300.0,
                height: 150.0,
                child: GeneratedImgTemBaseWidget2(),
              ),
              Positioned(
                left: 30.0,
                top: 245.0,
                right: null,
                bottom: null,
                width: 300.0,
                height: 150.0,
                child: GeneratedImgTemBaseWidget3(),
              ),
              Positioned(
                left: 30.0,
                top: 408.0,
                right: null,
                bottom: null,
                width: 300.0,
                height: 150.0,
                child: GeneratedImgTemBaseWidget4(),
              ),
              Positioned(
                left: 5.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 360.0,
                height: 60.0,
                child: GeneratedMenudeRegistroWidget2(),
              )
            ]),
      ),
    ));
  }
}