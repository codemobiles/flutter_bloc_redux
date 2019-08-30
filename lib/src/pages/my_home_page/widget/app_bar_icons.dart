import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/models/student.dart';
import 'package:cm_student_redux/src/redux/student/student_actions.dart';
import 'package:cm_student_redux/src/widget/simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppBarIcons extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AppBarIcons({@required this.formKey});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, _viewModel) => IconButton(
        icon: Icon(Icons.save),
        onPressed: () {
          if (!formKey.currentState.validate()) {
            return;
          }
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              _viewModel.onSaveStudent();
              return SimpleDialogCustom(
                title: "Save Profile",
                content: _viewModel.student.toString(),
                widget: Text("close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final Student student; // state
  final Function() onSaveStudent; // action

  _ViewModel({
    this.student,
    this.onSaveStudent,
  });

  static _ViewModel fromStore(Store<AppState> store) {
     _onSaveStudentAction(){
       store.dispatch(SaveStudentAction());
     }

    return _ViewModel(
      student: store.state.student,
      onSaveStudent: _onSaveStudentAction
    );
  }
}
