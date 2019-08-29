import 'package:cm_student_redux/src/models/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TabState {
  TabState([List props = const []]);
}

class TabUnInit extends TabState{
  @override
  String toString() => "TabUnInit";
}

class TabLoaded extends TabState{
  final List<TabMenu> tabs;

  TabLoaded(this.tabs);

  @override
  String toString() => "TabLoaded{tabs: ${tabs.toString()}";
}

class TabError extends TabState{
  final String error;

  TabError(this.error);

  @override
  String toString() => "TabError{error: $error";
}
