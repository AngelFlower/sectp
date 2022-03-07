import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedajusteswidget4/generated/GeneratedToggleOffWidget9.dart';

/* Frame Toggle Off
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedToggleOffWidget8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedToggleonWidget'),
      child: Container(
        width: 60.0,
        height: 30.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 60.0,
                height: 30.0,
                child: GeneratedToggleOffWidget9(),
              )
            ]),
      ),
    );
  }
}
