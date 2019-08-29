import 'package:cm_student_redux/src/models/course.dart';

class Student {
  String name;
  String company;

  List<Course> courses;

  Student({
    this.name = "",
    this.company = "",
    this.courses = const [],
  });

  @override
  String toString() => 'name: $name, company: $company, courses: $courses';
}
