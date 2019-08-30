import 'package:cm_student_redux/src/models/index.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final Student student;

  const AppState({this.student});

  factory AppState.initialState() =>
      AppState(student: Student(courses: []..add(Course())));

  @override
  String toString() => 'AppState{student: $student}';
}
