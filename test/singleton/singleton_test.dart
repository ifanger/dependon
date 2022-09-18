import 'package:dependon/dependon.dart';
import 'package:dependon/src/errors/dependency_injection_error.dart';
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

  group('singleton dependency', () {
    test('when singleton registered should retrieve instance', () {
      final TestClass testClass = TestClass('test');

      di.singleton(() => testClass);

      final result = di.get<TestClass>();
      expect(result.id, 'test');
    });

    test(
        'when singleton is not registered should throw an DependencyInjectionError',
        () {
      expect(
        () => di.get<TestClass>(),
        throwsA(isA<DependencyInjectionError>()),
      );
    });

    test('when singleton unregistered should throw an DependencyInjectionError',
        () {
      final TestClass testClass = TestClass('test');

      di.singleton(() => testClass);
      di.remove<TestClass>();

      expect(
        () => di.get<TestClass>(),
        throwsA(isA<DependencyInjectionError>()),
      );
    });

    test('when dependencies clear should throw an DependencyInjectionError',
        () {
      final TestClass testClass = TestClass('test');

      di.singleton(() => testClass);
      di.clear();

      expect(
        () => di.get<TestClass>(),
        throwsA(isA<DependencyInjectionError>()),
      );
    });
  });

  group('singleton with tag', () {
    test('should return expected instance when two instances available', () {
      final TestClass testClassA = TestClass('a');
      final TestClass testClassB = TestClass('b');

      di.singleton<TestClass>(() => testClassA, tag: 'a');
      di.singleton<TestClass>(() => testClassB, tag: 'b');

      final result = di.get<TestClass>(tag: 'b');
      expect(result.id, 'b');
    });

    test('should return expected instance when three instances available', () {
      final TestClass testClass = TestClass('empty');
      final TestClass testClassA = TestClass('a');
      final TestClass testClassB = TestClass('b');

      di.singleton<TestClass>(() => testClass);
      di.singleton<TestClass>(() => testClassA, tag: 'a');
      di.singleton<TestClass>(() => testClassB, tag: 'b');

      final result = di.get<TestClass>(tag: 'a');
      expect(result.id, 'a');
    });

    test('should return B instance when A removed', () {
      final TestClass testClassA = TestClass('a');
      final TestClass testClassB = TestClass('b');

      di.singleton<TestClass>(() => testClassA, tag: 'a');
      di.singleton<TestClass>(() => testClassB, tag: 'b');
      di.remove<TestClass>(tag: 'a');

      final result = di.get<TestClass>(tag: 'b');
      expect(result.id, 'b');
    });

    test('should throw instance when B removed', () {
      final TestClass testClass = TestClass('a');
      final TestClass testClassB = TestClass('b');

      di.singleton<TestClass>(() => testClass);
      di.singleton<TestClass>(() => testClassB, tag: 'b');
      di.remove<TestClass>(tag: 'b');

      expect(
        () => di.get<TestClass>(tag: 'b'),
        throwsA(isA<DependencyInjectionError>()),
      );
    });
  });
}
