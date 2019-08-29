import 'package:cm_student_redux/src/models/index.dart';
import 'package:cm_student_redux/src/utils/constant.dart';
import 'package:cm_student_redux/src/widget/form_card.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  var items = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length + 1,
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
                      //todo
                    },
                  ),
                )
              ],
            ),
          );
        }
        return items[index - 1];
      },
    );
  }
}

class ContactForm extends StatefulWidget {
  final int index;
  final Course contact;

  const ContactForm({
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
              //todo
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
                  //todo
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
