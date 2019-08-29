import 'package:cm_student_redux/src/models/tab_menu.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final List<TabMenu> tabMenu;

  TabSelector({
    @required this.tabMenu,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.lightBlueAccent,
      onTap: (index) {
        // print("index: ${index}");
      },
      tabs: tabMenu.map((TabMenu choice) {
        return Tab(
          text: choice.title,
          icon: Icon(choice.icon),
        );
      }).toList(),
    );
  }
}
