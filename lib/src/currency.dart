import 'package:moneymoneymoney/src/currencies.dart';
import 'package:moneymoneymoney/src/currency_format.dart';
import 'package:moneymoneymoney/src/placement.dart';

import 'exceptions/currency_exception.dart';

class Currency {
  /// ISO-4217 Currency Code.
  String _code;

  String get code => _code;

  String _symbol;

  String get symbol => _symbol;

  int _precision;

  int get precision => _precision;

  String _title;

  String get title => _title;

  String _thousandSeparator;

  String get thousandSeparator => _thousandSeparator;

  String _decimalSeparator;

  String get decimalSeparator => _decimalSeparator;

  SymbolPlacement _symbolPlacement;

  SymbolPlacement get symbolPlacement => _symbolPlacement;

  Currency(String code, [CurrencyFormat format]) : _code = code {
    if (format == null) {
      var currency = Currencies.get(code);

      if (format == null && currency == null) {
        throw CurrencyException('Currency not found: "$code"');
      }

      _symbol = currency.symbol;
      _precision = currency.precision;
      _title = currency.title;
      _thousandSeparator = currency.thousandSeparator;
      _decimalSeparator = currency.decimalSeparator;
      _symbolPlacement = currency.symbolPlacement;
    } else {
      _symbol = format.symbol;
      _precision = format.precision;
      _title = format.title;
      _thousandSeparator = format.thousandSeparator;
      _decimalSeparator = format.decimalSeparator;
      _symbolPlacement = format.symbolPlacement;
    }
  }

  bool get hasThousandSeparator => thousandSeparator.isNotEmpty;

  bool get hasDecimalSeparator => decimalSeparator.isNotEmpty;

  Currency.fromMap(Map<String, dynamic> map) {
    _code = map['code'];
    _title = map['title'];
    _symbol = map['symbol'];
    _precision = map['precision'];
    _thousandSeparator = map['thousandSeparator'];
    _decimalSeparator = map['decimalSeparator'];
    _symbolPlacement = map['symbolPlacement'];
  }
}
