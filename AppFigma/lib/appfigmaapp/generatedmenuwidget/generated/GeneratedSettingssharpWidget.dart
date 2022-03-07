import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/appfigmaapp/generatedmenuwidget/generated/GeneratedVectorWidget4.dart';

/* Frame settings-sharp
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedSettingssharpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedAjustesWidget4'),
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
          width: 30.0,
          height: 30.0,
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
                    double percentWidth = 0.8749241511027018;
                    double scaleX = (constraints.maxWidth * percentWidth) /
                        26.247724533081055;

                    double percentHeight = 0.8984375;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 26.953125;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX:
                              constraints.maxWidth * 0.06253790855407715,
                          translateY: constraints.maxHeight * 0.05078125,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: GeneratedVectorWidget4())
                    ]);
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
