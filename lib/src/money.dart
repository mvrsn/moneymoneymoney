import 'dart:math';

import 'package:intl/intl.dart';
import 'package:moneymoneymoney/src/currency.dart';
import 'package:moneymoneymoney/src/placement.dart';

class Money {
  int _amount;

  Currency _currency;

  Money(int amount, dynamic currency) : _amount = amount {
    assert(currency is String || currency is Currency);
    _currency = currency is String ? Currency(currency) : currency;
  }

  @override
  String toString() => format();

  String format({bool showDecimals = true}) {
    if (_currency.symbol == null) {
      return '${amount(showDecimals: showDecimals)} ${_currency.code}';
    } else if (_currency.symbolPlacement == SymbolPlacement.before) {
      return '${_currency.symbol}${amount(showDecimals: showDecimals)}';
    } else {
      return '${amount(showDecimals: showDecimals)}${_currency.symbol}';
    }
  }

  String amount({bool showDecimals = true}) {
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
      chars.insert(
        chars.length - _currency.precision,
        _currency.decimalSeparator,
      );
    } else {
      chars.removeRange(chars.length - _currency.precision, chars.length);
    }

    return chars.join('');
  }

  double get amountWithDecimals => _amount / pow(10, _currency.precision);

  int get amountWithoutDecimals => (_amount / pow(10, _currency.precision)).round();

  Money.parse(dynamic amount, [dynamic currency = 'USD']) {
    assert((amount is String && amount.isNotEmpty) || amount is int);
    assert(currency is String || currency is Currency);

    var parsedAmount = amount.toString();

    _currency = currency is String ? Currency(currency) : currency;

    // remove HTML encoded characters: http://stackoverflow.com/a/657670
    // special characters that arrive like &0234;
    parsedAmount = parsedAmount.replaceAll(r'&#?[a-zA-Z0-9]{2,8};', '');

    // remove all leading non numbers
    parsedAmount = parsedAmount.replaceAll(RegExp('^[^0-9]*'), '');

    // remove all thousands separators
    if (_currency.hasThousandSeparator) {
      parsedAmount =
          parsedAmount.replaceAll(r'' + _currency.thousandSeparator, '');
    }

    if (_currency.hasDecimalSeparator) {
      // remove all other characters
      parsedAmount = parsedAmount.replaceAll(r'[^\d]', '');

      // remove decimal separators
      parsedAmount =
          parsedAmount.replaceAll(r'' + _currency.decimalSeparator, '');
    } else {
      // for currencies that do not have decimal points
      // remove all other characters
      parsedAmount = parsedAmount.replaceAll(r'/[^\d]/', '');
    }

    _amount = int.parse(parsedAmount);
  }

  /// Format number to a particular currency.
  static String moneyFormat(int amount, [String currency = 'USD']) {
    return Money(amount, currency).format();
  }
}
