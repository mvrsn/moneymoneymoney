import 'package:moneymoneymoney/src/exceptions/currency_conflict_exception.dart';
import 'package:moneymoneymoney/src/exceptions/currency_not_found_exception.dart';
import 'package:moneymoneymoney/src/money.dart';
import 'package:test/test.dart';

void main() {
  test('it formats USD correctly', () {
    expect(Money(120090, 'USD').format(), equals('\$1,200.90'));
    expect(Money(120090000, 'USD').format(), equals('\$1,200,900.00'));
    expect(Money(1200, 'USD').format(), equals('\$12.00'));
    expect(Money(120, 'USD').format(), equals('\$1.20'));
  });

  test('it formats rupees correctly', () {
    expect(Money(15000000, 'INR').format(), equals('₹1,50,000.00'));
    expect(Money(15000000, 'INR').format(showDecimals: false),
        equals('₹1,50,000'));
  });

  test('it formats SEK correctly', () {
    expect(Money(150000, 'SEK').format(), equals('1 500,00 kr'));
  });

  test('it formats EUR correctly', () {
    expect(Money(150000, 'EUR').format(), equals('€1.500,00'));
    expect(Money(150000, 'EUR').format(showDecimals: false), equals('€1.500'));
  });

  test('it formats dinar correctly', () {
    expect(Money(1200900, 'JOD').format(), equals('1,200.900 JOD'));
  });

  test('it parses USD correctly', () {
    expect(Money.parse('\$1,200.90', 'USD').amountWithDecimals, equals(1200.9));
  });

  test(
      'it throws an exception when no currency is specified and there is a conflict',
      () {
    expect(() => Money.parse('1500 kr'),
        throwsA(TypeMatcher<CurrencyConflictException>()));
  });

  test('it rounds decimals', () {
    expect(Money.parse('\$99.90', 'USD').amountWithoutDecimals, equals(100));
    expect(Money.parse('\$99.90').amountWithoutDecimals, equals(100));
  });

  test('it parses rupees correctly', () {
    expect(Money.parse('₹1,50,000.00', 'INR').amountWithDecimals,
        equals(150000.0));
    expect(Money.parse('₹1,50,000.00', 'INR').amountWithoutDecimals,
        equals(150000));
    expect(Money.parse('₹1,50,000.00').format(showDecimals: false),
        equals('₹1,50,000'));
  });

  test('it parses money from a string', () {
    expect(Money.parse('2000', 'USD').amountWithDecimals, equals(20));
  });

  test('it throws an exception on an string without currency', () {
    expect(() => Money.parse('2000').amountWithDecimals,
        throwsA(TypeMatcher<CurrencyNotFoundException>()));
  });

  test('it throws an exception on an empty string', () {
    expect(() => Money.parse('').amountWithDecimals,
        throwsA(TypeMatcher<AssertionError>()));
  });

  test('it parses money from an int', () {
    expect(Money.parse(1000, 'USD').amountWithoutDecimals, equals(10));
  });

  test('it throws an exception on an int without currency', () {
    expect(() => Money.parse(2000).amountWithDecimals,
        throwsA(TypeMatcher<CurrencyNotFoundException>()));
  });
}
