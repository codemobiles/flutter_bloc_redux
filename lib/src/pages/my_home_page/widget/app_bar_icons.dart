import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/models/student.dart';
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

  _ViewModel({this.student});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        student: store.state.student,
    );
  }
}

