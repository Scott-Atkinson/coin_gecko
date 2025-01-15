import 'package:flutter_test/flutter_test.dart';
import 'package:coin_gecko/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CoinDetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
