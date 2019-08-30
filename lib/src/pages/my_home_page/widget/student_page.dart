import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/redux/student/student_actions.dart';
import 'package:cm_student_redux/src/utils/constant.dart';
import 'package:cm_student_redux/src/widget/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class StudentPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const StudentPage({@required this.formKey});

  @override
  _StudentPageState createState() => new _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(Constant.HEADER_IMAGE),
            ),
            StoreConnector<AppState, _ViewModel>(
              converter: _ViewModel.fromStore,
              builder: (BuildContext context, _ViewModel _viewModel) => FormCard(
                children: <Widget>[
                  TextFormField(
                    initialValue: _viewModel.student.name,
                    decoration: InputDecoration(
                      labelText: 'name',
                      icon: Icon(Icons.person),
                      hintText: "e.g. iBlurBlur",
                    ),
                    onSaved: (String name) {
                     _viewModel.student.name = name;
                    },
                  ),
                  TextFormField(
                    initialValue: _viewModel.student.name,
                    decoration: InputDecoration(
                        labelText: 'company',
                        icon: Icon(Icons.business),
                        hintText: "e.g. CodeMobiles Co., Ltd."),
                    onSaved: (String name) {
                      _viewModel.student.company = name;
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

                            _viewModel.onUpdateStudent(_viewModel.student);

                            return SimpleDialogCustom(
                              title: "Update Profile",
                              content: "${_viewModel.student.name} , ${_viewModel.student.company}",
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
            ),
          ],
        ),
      ],
    );
  }
}

class _ViewModel {
  final Student student; // state
  final Function(Student) onUpdateStudent;  //action

  _ViewModel({this.student, this.onUpdateStudent});

  static _ViewModel fromStore(Store<AppState> store) {
    _onUpdateStudent(Student student) {
      store.dispatch(UpdateStudentAction(student));
    }

    return _ViewModel(
      student: store.state.student,
      onUpdateStudent: _onUpdateStudent
    );
  }
}
