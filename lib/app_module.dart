import 'package:first_project/module/home/home_module.dart';
import 'package:first_project/theme_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ThemeStore())];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: HomeModule())];
}
