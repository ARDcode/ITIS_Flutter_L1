import 'package:dio/dio.dart';
import 'package:first_project/module/home/api_client.dart';
import 'package:first_project/module/home/model/cat.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'cat_store.g.dart';

// This is the class used by rest of your codebase
class CatStore = _CatStore with _$CatStore;

// The store-class
abstract class _CatStore with Store {
  String url =
      'https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true';

  @observable
  ObservableList<Cat> cats = ObservableList.of([]);

  @action
  void fetchNewCat({Function? onAdd}) {
    RestClient restClient = RestClient(Dio());
    restClient.getCats().then((List<Cat> cats) {
      this.cats.add(cats[0]);
      if (onAdd != null) {
        onAdd();
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  @computed
  List<Cat> get filteredCats =>
      cats.where((cat) => cat.width > cat.height).toList();
}
