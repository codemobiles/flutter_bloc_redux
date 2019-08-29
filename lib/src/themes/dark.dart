import 'package:cm_student_redux/src/utils/constant.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Constant.PRIMARY_COLOR,
    accentColor: Constant.PRIMARY_COLOR,
    hintColor: Constant.PRIMARY_COLOR,
    dividerColor: Constant.PRIMARY_COLOR,
    buttonColor: Constant.PRIMARY_COLOR,
    scaffoldBackgroundColor: Constant.PRIMARY_COLOR,
    canvasColor: Colors.blueAccent,
    fontFamily: Constant.QUICK_SAND_FONT,
  );
}
