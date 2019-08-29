import 'package:bloc/bloc.dart';
import 'package:cm_student_redux/src/bloc/flow_bloc.dart';
import 'package:cm_student_redux/src/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  BlocSupervisor.delegate = FlowBlocDelegate();
  return runApp(MyApp());
}
