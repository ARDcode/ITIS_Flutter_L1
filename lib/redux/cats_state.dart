import 'package:first_project/cat.dart';

class CatsState {
  final List<Cat> cats;

  CatsState({
    required this.cats,
  });

  factory CatsState.initial() => CatsState(
        cats: const [],
      );
}
