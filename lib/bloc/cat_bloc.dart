import 'package:dio/dio.dart';
import 'package:first_project/module/home/api_client.dart';
import 'package:first_project/module/home/model/cat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Cubit<List<Cat>> {
  CatBloc() : super([]);

  void getCats() {
    RestClient restClient = RestClient(Dio());
    restClient.getCats().then((List<Cat> cats) {
      emit(List.from(state)..add(cats[0]));
    }).catchError((error) {
      print(error.toString());
    });
  }
}
