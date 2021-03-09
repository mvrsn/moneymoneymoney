import 'package:moneymoneymoney/moneymoneymoney.dart';
import 'package:moneymoneymoney/src/exceptions/money_exception.dart';

class CurrencyConflictException extends MoneyException {
  final Iterable<Currency> currencies;

  CurrencyConflictException(this.currencies)
      : super('More than one currency found: ${currencies.map((e) => e.code)}');
}
