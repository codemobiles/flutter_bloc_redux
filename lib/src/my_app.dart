import 'package:cm_student_redux/src/pages/my_home_page/home_page.dart';
import 'package:cm_student_redux/src/themes/dark.dart';
import 'package:cm_student_redux/src/utils/index.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.APP_NAME,
      theme: darkTheme(),
      home: MyHomePage(),
    );
  }
}
