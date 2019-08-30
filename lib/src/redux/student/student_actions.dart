

import 'package:cm_student_redux/src/models/index.dart';

class UpdateStudentAction{
  final Student student;

  UpdateStudentAction(this.student);

  @override
  String toString() => "UpdateStudent{student: $student}";
}

class UpdateCourseStudentAction{
  final String name;
  final int index;

  UpdateCourseStudentAction(this.name, this.index);

  @override
  String toString() => "UpdateCourseStudent{name: $name, index: $index}";
}


class DeleteCourseStudentAction{
  final int index;

  DeleteCourseStudentAction(this.index);

  @override
  String toString() => "DeleteCourseStudent{index: $index}";
}

class AddCourseStudentAction{
  @override
  String toString() => "AddCourseStudentAction";
}



