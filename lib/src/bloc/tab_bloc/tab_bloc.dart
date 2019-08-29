import 'package:bloc/bloc.dart';
import 'package:cm_student_redux/src/bloc/tab_bloc/index.dart';
import 'package:cm_student_redux/src/models/index.dart';
import 'package:flutter/material.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  @override
  TabState get initialState => TabUnInit();

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is SetupTab) {
      yield* _mapTabUnInit(currentState, event);
    }
  }

  Stream<TabState> _mapTabUnInit(TabState currentState, SetupTab event) async* {
    if (currentState is TabUnInit) {
      try {
        List<TabMenu> tabs = List(event.tabLength);
        tabs[0] = (TabMenu(title: 'PROFILE', icon: Icons.person));
        tabs[1] = (TabMenu(title: 'COURSE', icon: Icons.school));

        yield TabLoaded(tabs);
      } catch (exception) {
        yield TabError(exception.toString());
      }
    }
  }
}
