

import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/redux/student/student_reducer.dart';

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
    student: studentReducer(state.student, action),
  );

}

// todo