import 'package:first_project/module/home/cat_store.dart';
import 'package:first_project/module/home/home_page.dart';
import 'package:first_project/module/home/screens/detail_info.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => CatStore())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(
                  title: 'HomeModule',
                )),
        ChildRoute('/detail/:title',
            child: (context, args) => DetailInfo(
                  title: args.params['title'],
                ),
            transition: TransitionType.downToUp),
      ];
}
