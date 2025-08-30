import 'package:test/test.dart';
import 'package:tdd_kata/string_calculator.dart';

void main() {
  late StringCalculator calc;

  setUp(() {
    calc = StringCalculator();
  });

  test('empty string returns 0', () {
    expect(calc.add(''), 0);
  });

  test('one number returns itself', () {
    expect(calc.add('1'), 1);
  });

  test('two numbers comma-separated', () {
    expect(calc.add('1,2'), 3);
  });

  test('handles unknown amount of numbers', () {
    expect(calc.add('1,2,3,4'), 10);
  });

  test('handles newlines between numbers', () {
    expect(calc.add('1\n2,3'), 6);
  });

  test('supports custom single-char delimiter', () {
    expect(calc.add('//;\n1;2'), 3);
  });

  test('throws with all negatives listed', () {
    try {
      calc.add('1,-2,3,-4');
      fail('Expected NegativeNumbersException');
    } on NegativeNumbersException catch (e) {
      expect(e.negatives, equals([-2, -4]));
      expect(e.toString(), 'negatives not allowed -2,-4');
    }
  });

  test('ignores numbers bigger than 1000', () {
    expect(calc.add('2,1001'), 2);
    expect(calc.add('1000,1'), 1001);
  });

  test('any-length delimiter with brackets', () {
    expect(calc.add('//[***]\n1***2***3'), 6);
  });

  test('multiple delimiters', () {
    expect(calc.add('//[*][%]\n1*2%3'), 6);
  });

  test('multiple delimiters with length > 1', () {
    expect(calc.add('//[**][%%]\n1**2%%3'), 6);
  });
}
