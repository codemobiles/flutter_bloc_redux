import 'package:meta/meta.dart';

@immutable
abstract class TabEvent {
  TabEvent([List props = const []]);
}

class SetupTab extends TabEvent {
  final int tabLength;

  SetupTab(this.tabLength);

  @override
  String toString() => "SetupTab{tabLength: $tabLength}";
}

