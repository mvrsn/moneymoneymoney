import 'package:moneymoneymoney/src/currencies.dart';
import 'package:test/test.dart';

void main() {
  test('it can get all currencies', () {
    expect(Currencies.all, isList);
  });

  test('it can get a specific currency', () {
    var currency = Currencies.get('eur');

    expect(currency, isNotNull);
    expect(currency.code, equals('EUR'));
  });

  test('it returns null if currency does not exist', () {
    var currency = Currencies.get('i dont exist');

    expect(currency, isNull);
  });
}
