import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/modules/comics/comics_repository.dart';

void main() {
  ComicsRepository repository;

  setUpAll(() {
    repository = ComicsRepository();
  });
}
