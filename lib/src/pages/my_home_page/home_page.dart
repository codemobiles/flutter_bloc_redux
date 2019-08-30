import 'package:cm_student_redux/src/bloc/tab_bloc/index.dart';
import 'package:cm_student_redux/src/pages/my_home_page/widget/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _tabBloc = TabBloc();

  @override
  void initState() {
    _tabBloc.dispatch(SetupTab(2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _tabBloc,
      builder: (context, state) {
        if (state is TabLoaded) {
          return DefaultTabController(
            length: state.tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Redux + BLOC'),
                actions: <Widget>[
                  AppBarIcons(formKey: _formKey),
                ],
                bottom: TabBar(
                  tabs: <Widget>[
                    for (final item in state.tabs)
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(item.icon),
                            SizedBox(
                              width: 8,
                            ),
                            Text(item.title),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              body: Body(
                formKey: _formKey,
              ),
              bottomNavigationBar: TabSelector(
                tabMenu: state.tabs,
              ),
            ),
          );
        }

        if (state is TabError) {
          return Text(state.error);
        }

        return Text("Uninit");
      },
    );
  }
}

//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 2,
//      child: Scaffold(
//        body: TabBarView(
//          children: <Widget>[
//            Center(
//              child: FlutterLogo(
//                size: 150,
//              ),
//            ),
//            Center(
//              child: FlutterLogo(
//                size: 350,
//              ),
//            ),
//          ],
//        ),
//        bottomNavigationBar: TabBar(
//          tabs: <Widget>[
//            Tab(
//              icon: Icon(Icons.radio),
//              text: "tab1",
//            ),
//            Tab(
//              icon: Icon(Icons.error),
//              text: "tab2",
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
