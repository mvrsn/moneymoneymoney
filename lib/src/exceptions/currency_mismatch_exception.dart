import 'package:moneymoneymoney/moneymoneymoney.dart';
import 'package:moneymoneymoney/src/exceptions/money_exception.dart';

class CurrencyMismatchException extends MoneyException {
  CurrencyMismatchException(Money a, Money b)
      : super('Currencies has to be the same, got: ${a.currency.code} and ${b.currency.code}');
}
