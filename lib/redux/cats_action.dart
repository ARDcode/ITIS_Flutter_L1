import 'package:dio/dio.dart';
import 'package:first_project/module/home/api_client.dart';
import 'package:first_project/module/home/model/cat.dart';
import 'package:first_project/redux/cats_state.dart';
import 'package:redux/redux.dart';

class SetCatsStateAction {
  final CatsState catsState;

  SetCatsStateAction(this.catsState);
}

Future<void> fetchPostsAction(Store store) async {
  RestClient restClient = RestClient(Dio());
  restClient.getCats().then((List<Cat> cats) {
    SetCatsStateAction(
      CatsState(
        cats: cats,
      ),
    );
  }).catchError((error) {
    print(error.toString());
  });
}
