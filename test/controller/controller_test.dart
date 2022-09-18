import 'package:dependon/dependon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../infrastructure/test_class.dart';

void main() {
  late Dependon di;

  setUp(() {
    di = Dependon.instance;
  });

  tearDown(() {
    di.clear();
  });

  group('controller', () {
    test('when controller registered should return instance', () {
      di.controller<TestClass>(() => TestClass('id'));

      final result = di.get<TestClass>();

      expect(result.id, 'id');
    });

    test('when instance changed should return same instance', () {
      di.controller<TestClass>(() => TestClass('id'));

      final instance = di.get<TestClass>();
      instance.id = 'newId';
      final otherInstance = di.get<TestClass>();

      expect(otherInstance.id, 'newId');
    });

    test('when instance unset should create new reseted instance', () {
      di.controller<TestClass>(() => TestClass('id'));

      final instance = di.get<TestClass>();
      instance.id = 'newId';
      di.unset<TestClass>();

      final otherInstance = di.get<TestClass>();

      expect(otherInstance.id, 'id');
    });
  });
}
