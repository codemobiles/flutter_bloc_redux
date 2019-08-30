import 'package:cm_student_redux/src/pages/my_home_page/widget/index.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const Body({@required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Form(
        key: formKey,
        child: TabBarView(
          children: <Widget>[
            StudentPage(formKey: formKey,),
            CoursePage(),
          ],
        ),
      ),
    );
  }
}
