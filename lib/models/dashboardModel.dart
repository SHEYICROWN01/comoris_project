import 'package:flutter/material.dart';

class DashboardModel{
  String? name1;
  String? name2;
  Color? colors;
  Function? onclick;

  DashboardModel(this.name1, this.name2, this.colors, {this.onclick});

  @override
  String toString() {
    return 'DashboardModel{name1: $name1, name2: $name2}';
  }
}