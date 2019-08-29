import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/utils/constant.dart';
import 'package:cm_student_redux/src/widget/index.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const StudentPage({@required this.formKey});

  @override
  _StudentPageState createState() => new _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  Student student;

  @override
  void initState() {
    super.initState();

    student = Student();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(Constant.HEADER_IMAGE),
              ),
              FormCard(
                children: <Widget>[
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      labelText: 'name',
                      icon: Icon(Icons.person),
                      hintText: "e.g. iBlurBlur",
                    ),
                    onSaved: (String name) {
                      student.name = name;
                    },
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                        labelText: 'company',
                        icon: Icon(Icons.business),
                        hintText: "e.g. CodeMobiles Co., Ltd."),
                    onSaved: (String name) {
                      student.company = name;
                    },
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      elevation: 4.0,
                      child: Text('Update Profile'),
                      textColor: Colors.white,
                      onPressed: () {
                        widget.formKey.currentState.save();

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return SimpleDialogCustom(
                              title: "Update Profile",
                              content: "${student.name} , ${student.company}",
                              widget: Text("ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
