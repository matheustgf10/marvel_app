import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/modules/home/home_repository.dart';

void main() {
  HomeRepository repository;

  setUpAll(() {
    repository = HomeRepository();
  });
}
