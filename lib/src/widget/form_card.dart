import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final List<Widget> children;

  FormCard({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 12.0, bottom: 18.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
