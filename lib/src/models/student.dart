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

  factory Student.fromJson(Map<String, dynamic> json) => new Student(
    name: json["name"],
    company: json["company"],
    courses: new List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "company": company,
    "courses": new List<dynamic>.from(courses.map((x) => x.toJson())),
  };

  @override
  String toString() => 'name: $name, company: $company, courses: $courses';
}
