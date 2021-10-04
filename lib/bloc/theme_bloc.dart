import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Cubit<ThemeData> {
  ThemeBloc() : super(ThemeData.light());

  void setTheme(ThemeData themeData) {
    emit(themeData);
  }
}
