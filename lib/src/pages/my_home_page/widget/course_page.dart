import 'package:cm_student_redux/src/models/app_state.dart';
import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/redux/student/student_actions.dart';
import 'package:cm_student_redux/src/utils/constant.dart';
import 'package:cm_student_redux/src/widget/form_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, _viewModel) {
          final item = []
            ..addAll(_viewModel.student.courses.map((item) => ContactForm(
                  contact: item,
                  index: _viewModel.student.courses.indexOf(item),
                  viewModel: _viewModel,
                )))
            ..toList();

          return ListView.builder(
            itemCount: item.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(Constant.HEADER_IMAGE),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: RaisedButton(
                          elevation: 4.0,
                          color: Colors.deepPurpleAccent,
                          textColor: Theme.of(context).secondaryHeaderColor,
                          child: Text('ADD COURSE'),
                          onPressed: () {
                            _viewModel.onAddCourse();
                          },
                        ),
                      )
                    ],
                  ),
                );
              }
              return item[index - 1];
            },
          );
        });
  }
}

class ContactForm extends StatefulWidget {
  final int index;
  final Course contact;
  final _ViewModel viewModel;

  const ContactForm({
    @required this.viewModel,
    @required this.contact,
    @required this.index,
  });

  @override
  _ContactFormState createState() => new _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return FormCard(
      children: <Widget>[
        TextFormField(
          initialValue: widget.contact.name,
          decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(Icons.school),
              hintText: "e.g. Flutter Core"),
          onFieldSubmitted: (String name) {
            if (name != widget.contact.name) {
              widget.viewModel.onUpdateCourse(
                name,
                widget.index,
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FlatButton(
                onPressed: () {
                  widget.viewModel.onDeleteCourse(widget.index);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w300),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _ViewModel {
  final Student student; // state
  final Function(String, int) onUpdateCourse; //action
  final Function(int) onDeleteCourse; //action
  final Function() onAddCourse; //action

  _ViewModel({
    this.student,
    this.onUpdateCourse,
    this.onDeleteCourse,
    this.onAddCourse
  });

  static _ViewModel fromStore(Store<AppState> store) {
    _onUpdateCourse(String name, int index) {
      store.dispatch(UpdateCourseStudentAction(name, index));
    }

    _onDeleteCourse(int index) {
      store.dispatch(DeleteCourseStudentAction(index));
    }

    _onAddCourse() {
      store.dispatch(AddCourseStudentAction());
    }

    return _ViewModel(
        onAddCourse: _onAddCourse,
        student: store.state.student,
        onUpdateCourse: _onUpdateCourse,
        onDeleteCourse: _onDeleteCourse);
  }
}
