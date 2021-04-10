// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$comicsAtom = Atom(name: 'HomeStoreBase.comics');

  @override
  List<Comics> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(List<Comics> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  final _$isLoaderComicsAtom = Atom(name: 'HomeStoreBase.isLoaderComics');

  @override
  bool get isLoaderComics {
    _$isLoaderComicsAtom.reportRead();
    return super.isLoaderComics;
  }

  @override
  set isLoaderComics(bool value) {
    _$isLoaderComicsAtom.reportWrite(value, super.isLoaderComics, () {
      super.isLoaderComics = value;
    });
  }

  final _$isPressedDropdownOrderByAtom =
      Atom(name: 'HomeStoreBase.isPressedDropdownOrderBy');

  @override
  bool get isPressedDropdownOrderBy {
    _$isPressedDropdownOrderByAtom.reportRead();
    return super.isPressedDropdownOrderBy;
  }

  @override
  set isPressedDropdownOrderBy(bool value) {
    _$isPressedDropdownOrderByAtom
        .reportWrite(value, super.isPressedDropdownOrderBy, () {
      super.isPressedDropdownOrderBy = value;
    });
  }

  final _$isReloadedComicsAtom = Atom(name: 'HomeStoreBase.isReloadedComics');

  @override
  bool get isReloadedComics {
    _$isReloadedComicsAtom.reportRead();
    return super.isReloadedComics;
  }

  @override
  set isReloadedComics(bool value) {
    _$isReloadedComicsAtom.reportWrite(value, super.isReloadedComics, () {
      super.isReloadedComics = value;
    });
  }

  final _$isNetworkErrorAtom = Atom(name: 'HomeStoreBase.isNetworkError');

  @override
  bool get isNetworkError {
    _$isNetworkErrorAtom.reportRead();
    return super.isNetworkError;
  }

  @override
  set isNetworkError(bool value) {
    _$isNetworkErrorAtom.reportWrite(value, super.isNetworkError, () {
      super.isNetworkError = value;
    });
  }

  @override
  String toString() {
    return '''
comics: ${comics},
isLoaderComics: ${isLoaderComics},
isPressedDropdownOrderBy: ${isPressedDropdownOrderBy},
isReloadedComics: ${isReloadedComics},
isNetworkError: ${isNetworkError}
    ''';
  }
}
