import 'package:flutter_test/flutter_test.dart';
import 'package:tea_cafe/counter.dart';

void main() {
  test('Should incement value of counter by 1', () {
    Counter obj = Counter();
    obj.incrementCounter();
    expect(obj.value, 1);
  });
  group('Counter', () {
    test('Object should initialize with 0', () {
      Counter obj = Counter();
      expect(obj.value, 0);
    });
    test('Should incement value of counter by 1', () {
      Counter obj = Counter();
      obj.incrementCounter();
      expect(obj.value, 1);
    });
    test('Should decrement value of counter by 1', () {
      Counter obj = Counter();
      obj.decrementCounter();
      expect(obj.value, -1);
    });
  });
}
