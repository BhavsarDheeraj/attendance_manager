import 'package:attendance_manager/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Manager',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Color.fromRGBO(240, 240, 240, 1),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24,
          ),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
        canvasColor: Color.fromRGBO(240, 240, 240, 1),
        primaryColor: Color.fromRGBO(16, 69, 250, 1),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        accentColor: Color.fromRGBO(16, 69, 250, 1),
        buttonTheme: ButtonThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            textTheme: ButtonTextTheme.primary),
      ),
    );
  }
}
