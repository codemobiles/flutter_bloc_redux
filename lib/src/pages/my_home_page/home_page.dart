import 'package:cm_student_redux/src/models/tab_menu.dart';
import 'package:cm_student_redux/src/pages/my_home_page/widget/index.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<TabMenu> tabMenu = List(2);

  @override
  void initState() {
    super.initState();

    tabMenu[0] = (TabMenu(title: 'PROFILE', icon: Icons.person));
    tabMenu[1] = (TabMenu(title: 'COURSE', icon: Icons.school));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabMenu.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Redux + BLOC'),
          actions: <Widget>[
            AppBarIcons(formKey: _formKey),
          ],
        ),
        body: Body(
          formKey: _formKey,
        ),
        bottomNavigationBar: TabSelector(
          tabMenu: tabMenu,
        ),
      ),
    );
  }
}
