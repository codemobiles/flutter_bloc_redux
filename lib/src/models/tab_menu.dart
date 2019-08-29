import 'package:flutter/material.dart';

class TabMenu {
  final String title;
  final IconData icon;

  const TabMenu({
    this.title,
    this.icon,
  });

  @override
  String toString() => 'title: $title, icon: $icon';
}
