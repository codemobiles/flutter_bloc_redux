import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/pages/my_home_page/home_page.dart';
import 'package:cm_student_redux/src/redux/app_reducers.dart';
import 'package:cm_student_redux/src/redux/student/student_middleware.dart';
import 'package:cm_student_redux/src/themes/dark.dart';
import 'package:cm_student_redux/src/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {
  var _store = Store<AppState>(appReducers,
      initialState: AppState.initialState(),
      middleware: [
        LoggingMiddleware<dynamic>.printer(),
        studentMiddleware,
      ]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.APP_NAME,
        theme: darkTheme(),
        home: MyHomePage(),
      ),
    );
  }
}
