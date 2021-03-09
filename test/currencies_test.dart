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
    expect(Currencies.get('i dont exist'), isNull);
  });

  test('it finds currencies', () {
    expect(Currencies.find('₹1,50,000').first.code, equals('INR'));
    expect(Currencies.find('AU\$200').first.code, equals('AUD'));
    expect(Currencies.find('Z\$200').first.code, equals('ZWD'));
  });

  test('it does not find USD when finding currencies that contain \$', () {
    expect(Currencies.find('Z\$200').length, equals(1));
  });

}
