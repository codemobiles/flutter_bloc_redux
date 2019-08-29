import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/redux/student/student_actions.dart';
import 'package:redux/redux.dart';



final studentReducer = combineReducers<Student>([
  TypedReducer<Student, UpdateStudentAction>(updateStudent),
  TypedReducer<Student, UpdateCourseStudentAction>(updateCourse),
  TypedReducer<Student, DeleteCourseStudentAction>(deleteCourse),
]);

Student updateStudent(Student student, UpdateStudentAction event) {
  return Student(
    name: event.student.name,
    company: event.student.company,
    courses: student.courses,
  );
}

Student updateCourse(Student student, UpdateCourseStudentAction event) {
  return Student(
      name: student.name,
      company: student.company,
      courses: student.courses
        ..removeAt(event.index)
        ..add(Course(name: event.name)));

  // map
}

Student deleteCourse(Student student, DeleteCourseStudentAction event) {
  return Student(
    name: student.name,
    company: student.company,
    courses: student.courses..removeAt(event.index),
  );
}
