import 'package:cm_student_redux/src/models/student.dart';
import 'package:cm_student_redux/src/widget/simple_dialog.dart';
import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AppBarIcons({@required this.formKey});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () {
        if (!formKey.currentState.validate()) {
          return;
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialogCustom(
              title: "Save Profile",
              content: "redux",
              widget: Text("close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }
}
