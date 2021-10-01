// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatStore on _CatStore, Store {
  final _$catsAtom = Atom(name: '_CatStore.cats');

  @override
  ObservableList<Cat> get cats {
    _$catsAtom.reportRead();
    return super.cats;
  }

  @override
  set cats(ObservableList<Cat> value) {
    _$catsAtom.reportWrite(value, super.cats, () {
      super.cats = value;
    });
  }

  final _$_CatStoreActionController = ActionController(name: '_CatStore');

  @override
  void fetchNewCat() {
    final _$actionInfo =
        _$_CatStoreActionController.startAction(name: '_CatStore.fetchNewCat');
    try {
      return super.fetchNewCat();
    } finally {
      _$_CatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cats: ${cats}
    ''';
  }
}
