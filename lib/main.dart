import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/model/tour.dart';
import 'package:flutter_app_ex1/pages/splash_screen.dart';
import 'package:flutter_app_ex1/pages/tour_page.dart';
import 'package:flutter_app_ex1/utils/assets_constants.dart';
import 'package:flutter_app_ex1/utils/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const _popinFontFamily = 'Poppins';

  AppRouter _router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: _popinFontFamily,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: _popinFontFamily,
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),
          bodyText1: TextStyle(
              color: Colors.white,
              fontFamily: _popinFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),
          bodyText2: TextStyle(
              color: Colors.black,
              fontFamily: _popinFontFamily,
              fontSize: 21,
              fontWeight: FontWeight.w300
          ),
          subtitle1: TextStyle(
              color: Colors.black,
              fontFamily: _popinFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w500
          ),
          subtitle2: TextStyle(
              color: Color.fromARGB(255, 0x78, 0xCA, 0xDE),
              fontFamily: _popinFontFamily,
              fontSize: 19,
              fontWeight: FontWeight.w600
          ),
          headline2: TextStyle(
              color: Colors.black,
              fontFamily: _popinFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontFamily: _popinFontFamily,
            fontSize: 11,
            fontWeight: FontWeight.w500
          ),
          headline4: TextStyle(
              color: Color.fromARGB(255, 0x78, 0xCA, 0xDE),
              fontFamily: _popinFontFamily,
              fontSize: 11,
              fontWeight: FontWeight.w500
          ),
          headline5: TextStyle(
              color: Colors.black,
              fontFamily: _popinFontFamily,
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
          headline6: TextStyle(
              color: Colors.black,
              fontFamily: _popinFontFamily,
              fontSize: 30,
              fontWeight: FontWeight.w900
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _router.generateRoute,
    );
  }
}