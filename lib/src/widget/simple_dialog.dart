import 'package:flutter/material.dart';

class SimpleDialogCustom extends StatelessWidget {
  final String title;
  final String content;
  final Widget widget;
  final VoidCallback onPressed;

  SimpleDialogCustom({
    @required this.title,
    @required this.content,
    this.widget = const Text("ok"),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: onPressed,
          child: widget,
        )
      ],
    );
  }
}
