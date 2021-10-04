import 'package:first_project/redux/cats_action.dart';
import 'package:first_project/redux/cats_state.dart';

postsReducer(CatsState prevState, SetCatsStateAction action) {
  final payload = action.catsState;
  return payload.cats;
}
