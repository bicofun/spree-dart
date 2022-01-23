import 'package:dotenv/dotenv.dart';
import 'package:spree/spree.dart';
import 'package:test/test.dart';

void main() {
  group('Spree.prefix', () {
    test('throws if prefix_URL is null', () {
      expect(
          () => Spree.prefix('SPREE_TEST'),
          throwsA(predicate((e) =>
              e is AssertionError && e.message == 'SPREE_TEST_URL is null')));
    });

    test('throws if prefix_URL is empty', () {
      env.addAll({
        'SPREE_TEST_URL': '',
      });
      expect(
          () => Spree.prefix('SPREE_TEST'),
          throwsA(predicate((e) =>
              e is AssertionError && e.message == 'SPREE_TEST_URL is empty')));
    });
  });
}
