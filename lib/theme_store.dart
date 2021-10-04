import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'theme_store.g.dart';

// This is the class used by rest of your codebase
class ThemeStore = _ThemeStore with _$ThemeStore;

// The store-class
abstract class _ThemeStore with Store {
  @observable
  ThemeData theme = ThemeData.light();

  @action
  setTheme(ThemeData theme) {
    this.theme = theme;
  }
}
