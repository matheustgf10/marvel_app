import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/modules/comics/comics_store.dart';

void main() {
  ComicsStore store;

  setUpAll(() {
    store = ComicsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
