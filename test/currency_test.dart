import 'package:moneymoneymoney/src/currency.dart';
import 'package:moneymoneymoney/src/currency_format.dart';
import 'package:moneymoneymoney/src/exceptions/currency_exception.dart';
import 'package:moneymoneymoney/src/placement.dart';
import 'package:test/test.dart';

void main() {
  test('it can get currency data', () {
    var currency = Currency('USD');

    expect(currency.code, equals('USD'));
    expect(currency.symbol, equals('\$'));
    expect(currency.title, equals('US Dollar'));
    expect(currency.precision, equals(2));
    expect(currency.thousandSeparator, equals(','));
    expect(currency.decimalSeparator, equals('.'));
    expect(currency.symbolPlacement, equals(SymbolPlacement.before));
  });

  test('it supports custom currency formats', () {
    var currency = Currency('FRF', CurrencyFormat(
      symbol: '₣',
      title: 'Franc',
      precision: 2,
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolPlacement: SymbolPlacement.after,
    ));

    expect(currency.code, equals('FRF'));
    expect(currency.symbol, equals('₣'));
    expect(currency.title, equals('Franc'));
    expect(currency.precision, equals(2));
    expect(currency.thousandSeparator, equals('.'));
    expect(currency.decimalSeparator, equals(','));
    expect(currency.symbolPlacement, equals(SymbolPlacement.after));
  });

  test('it throws an exception when no format is found', () {
    expect(() => Currency('FRF'), throwsA(TypeMatcher<CurrencyException>()));
  });
}

