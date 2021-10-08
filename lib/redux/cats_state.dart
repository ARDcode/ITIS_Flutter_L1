import 'package:first_project/module/home/model/cat.dart';

class CatsState {
  final List<Cat> cats;

  CatsState({
    required this.cats,
  });

  factory CatsState.initial() => CatsState(
        cats: const [],
      );
}
