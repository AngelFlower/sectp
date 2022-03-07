import 'package:flutter/material.dart';
import 'package:flutterapp/appfigmaapp/generatedloginwidget/GeneratedLoginWidget.dart';
import 'package:flutterapp/appfigmaapp/generatedinputwidget2/GeneratedInputWidget2.dart';
import 'package:flutterapp/appfigmaapp/generatedbotonwidget1/GeneratedBotonWidget1.dart';
import 'package:flutterapp/appfigmaapp/generatedmenuwidget/GeneratedMenuWidget.dart';
import 'package:flutterapp/appfigmaapp/generatedaadirregistrowidget/GeneratedAadirRegistroWidget.dart';
import 'package:flutterapp/appfigmaapp/generatedperfilwidget2/GeneratedPerfilWidget2.dart';
import 'package:flutterapp/appfigmaapp/generatedbannerwidget1/GeneratedBannerWidget1.dart';
import 'package:flutterapp/appfigmaapp/generatedbannerwidget2/GeneratedBannerWidget2.dart';
import 'package:flutterapp/appfigmaapp/generatedregistroswidget3/GeneratedRegistrosWidget3.dart';
import 'package:flutterapp/appfigmaapp/generatedajusteswidget4/GeneratedAjustesWidget4.dart';
import 'package:flutterapp/appfigmaapp/generatedtoggleonwidget/GeneratedToggleonWidget.dart';
import 'package:flutterapp/appfigmaapp/generatedmenuinferiorwidget5/GeneratedMenuInferiorWidget5.dart';
import 'package:flutterapp/appfigmaapp/generatedmenuderegistrowidget4/GeneratedMenudeRegistroWidget4.dart';
import 'package:flutterapp/appfigmaapp/generatedbuscadorwidget1/GeneratedBuscadorWidget1.dart';
import 'package:flutterapp/appfigmaapp/generatedimgtembasewidget5/GeneratedImgTemBaseWidget5.dart';
import 'package:flutterapp/appfigmaapp/generatedperfil1widget/GeneratedPerfil1Widget.dart';
import 'package:flutterapp/appfigmaapp/generatedshieldcheckmarkwidget/GeneratedShieldcheckmarkWidget.dart';
import 'package:flutterapp/appfigmaapp/generatedregistrosusuariowidget3/GeneratedRegistrosUsuarioWidget3.dart';
import 'package:flutterapp/appfigmaapp/generateddropdownwidget/GeneratedDropDownWidget.dart';

void main() {
  runApp(AppFigmaApp());
}

class AppFigmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/GeneratedLoginWidget',
      routes: {
        '/GeneratedLoginWidget': (context) => GeneratedLoginWidget(),
        '/GeneratedInputWidget2': (context) => GeneratedInputWidget2(),
        '/GeneratedBotonWidget1': (context) => GeneratedBotonWidget1(),
        '/GeneratedMenuWidget': (context) => GeneratedMenuWidget(),
        '/GeneratedAadirRegistroWidget': (context) =>
            GeneratedAadirRegistroWidget(),
        '/GeneratedPerfilWidget2': (context) => GeneratedPerfilWidget2(),
        '/GeneratedBannerWidget1': (context) => GeneratedBannerWidget1(),
        '/GeneratedBannerWidget2': (context) => GeneratedBannerWidget2(),
        '/GeneratedRegistrosWidget3': (context) => GeneratedRegistrosWidget3(),
        '/GeneratedAjustesWidget4': (context) => GeneratedAjustesWidget4(),
        '/GeneratedToggleonWidget': (context) => GeneratedToggleonWidget(),
        '/GeneratedMenuInferiorWidget5': (context) =>
            GeneratedMenuInferiorWidget5(),
        '/GeneratedMenudeRegistroWidget4': (context) =>
            GeneratedMenudeRegistroWidget4(),
        '/GeneratedBuscadorWidget1': (context) => GeneratedBuscadorWidget1(),
        '/GeneratedImgTemBaseWidget5': (context) =>
            GeneratedImgTemBaseWidget5(),
        '/GeneratedPerfil1Widget': (context) => GeneratedPerfil1Widget(),
        '/GeneratedShieldcheckmarkWidget': (context) =>
            GeneratedShieldcheckmarkWidget(),
        '/GeneratedRegistrosUsuarioWidget3': (context) =>
            GeneratedRegistrosUsuarioWidget3(),
        '/GeneratedDropDownWidget': (context) => GeneratedDropDownWidget(),
      },
    );
  }
}
