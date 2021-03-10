import 'dart:math';

import 'package:moneymoneymoney/moneymoneymoney.dart';
import 'package:moneymoneymoney/src/currency.dart';
import 'package:moneymoneymoney/src/exceptions/currency_mismatch_exception.dart';
import 'package:moneymoneymoney/src/placement.dart';

class Money {
  final int _amount;

  final Currency _currency;

  Money(int amount, dynamic currency)
      : assert(currency is String || currency is Currency),
        _amount = amount,
        _currency = currency is String ? Currency(currency) : currency;

  Currency get currency => _currency;

  @override
  String toString() => format();

  int get amount => _amount;

  double get amountWithDecimals => _amount / pow(10, _currency.precision);

  int get amountWithoutDecimals =>
      (_amount / pow(10, _currency.precision)).round();

  String format({bool showDecimals = true}) {
    if (_amount == null) {
      return '';
    }

    // Use language code if there is no symbol
    if (_currency.symbol == null) {
      return '${formatAmount(showDecimals: showDecimals)} ${_currency.code}';
    }

    // Symbol before currency
    if (_currency.symbolPlacement == SymbolPlacement.before) {
      return '${_currency.symbol}${formatAmount(showDecimals: showDecimals)}';
    }

    // Symbol after currency
    return '${formatAmount(showDecimals: showDecimals)}${_currency.symbol}';
  }

  String formatAmount({bool showDecimals = true}) {
    var chars = _amount.toString().split('');
    var skip = 3;

    for (var i = chars.length - _currency.precision - 3; i > 0; i -= skip) {
      chars.insert(i, _currency.thousandSeparator);

      // Indian Rupees use special format (₹1,50,000.00) so after the first
      // jump of three digits we only want to skip two steps
      if (_currency.code == 'INR') {
        skip = 2;
      }
    }

    if (showDecimals) {
      // Insert the decimal separator from the back
      chars.insert(
        chars.length - _currency.precision,
        _currency.decimalSeparator,
      );
    } else {
      // Remove the decimals based on precision
      chars.removeRange(chars.length - _currency.precision, chars.length);
    }

    return chars.join('');
  }

  factory Money.parse(String amount, Currency /*!*/ currency) {
    assert(amount.isNotEmpty);

    var _amount = amount.toString();
    var _currency = currency;

    // remove HTML encoded characters: http://stackoverflow.com/a/657670
    // special characters that arrive like &0234;
    _amount = _amount.replaceAll(r'&#?[a-zA-Z0-9]{2,8};', '');

    // remove all leading non numbers
    _amount = _amount.replaceAll(RegExp('[^0-9]*'), '');

    return Money(int.parse(_amount), _currency);
  }

  Money add(Money money) {
    _assertMatchingCurrency(this, money);
    return Money(_amount + money.amount, currency);
  }

  Money subtract(Money money) {
    _assertMatchingCurrency(this, money);
    return Money(_amount - money.amount, currency);
  }

  Money multiply(double multiplier) {
    return Money((_amount * multiplier).round(), currency);
  }

  Money divide(double divisor) {
    return Money((_amount / divisor).round(), currency);
  }

  void _assertMatchingCurrency(Money a, Money b) {
    if (a.currency != b.currency) {
      throw CurrencyMismatchException(a, b);
    }
  }

  /// Format number to a particular currency.
  static String moneyFormat(int amount, [String currency = 'USD']) {
    return Money(amount, currency).format();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Money &&
          runtimeType == other.runtimeType &&
          _amount == other._amount &&
          _currency == other._currency;

  @override
  int get hashCode => _amount.hashCode ^ _currency.hashCode;
}
