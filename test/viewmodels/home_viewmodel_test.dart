import 'package:flutter_test/flutter_test.dart';
import 'package:coin_gecko/app/app.locator.dart';
import 'package:coin_gecko/ui/views/home/home_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant', () {});
    });
  });
}
