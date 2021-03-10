import 'package:moneymoneymoney/moneymoneymoney.dart';
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
    expect(Money.parse('\$1,200.90', Currency('USD')).amountWithDecimals, equals(1200.9));
  });

  test('it rounds decimals', () {
    expect(Money.parse('\$99.90', Currency('USD')).amountWithoutDecimals, equals(100));
  });

  test('it parses rupees correctly', () {
    expect(Money.parse('₹1,50,000.00', Currency('INR')).amountWithDecimals,
        equals(150000.0));
    expect(Money.parse('₹1,50,000.00', Currency('INR')).amountWithoutDecimals,
        equals(150000));
    expect(Money.parse('₹1,50,000.00', Currency('INR')).format(showDecimals: false),
        equals('₹1,50,000'));
  });

  test('it parses SEK correctly', () {
    expect(Money.parse('91,08 SEK', Currency('SEK')).format(), equals('91,08 kr'));
  });

  test('it parses money from a string', () {
    expect(Money.parse('2000', Currency('USD')).amountWithDecimals, equals(20));
  });

  test('it throws an exception on an empty string', () {
    expect(() => Money.parse('', Currency('USD')).amountWithDecimals,
        throwsA(TypeMatcher<AssertionError>()));
  });
}
