



import 'dart:convert';

import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/redux/student/student_actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void studentMiddleware(Store<AppState> store, action, NextDispatcher next){



  if(action is SaveStudentAction){
    saveStudentToPref(store);
  }

  next(action);
}

void saveStudentToPref(Store<AppState> store) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final studentJsonString = json.encode(store.state.student.toJson());
  preferences.setString("student_state", studentJsonString);

  print("saveStudentToPref{studentJsonString: $studentJsonString}");
}
