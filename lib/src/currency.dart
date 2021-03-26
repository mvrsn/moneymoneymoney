import 'package:moneymoneymoney/src/currencies.dart';
import 'package:moneymoneymoney/src/currency_format.dart';
import 'package:moneymoneymoney/src/placement.dart';

import 'exceptions/currency_exception.dart';

class Currency {
  /// ISO-4217 Currency Code.
  String _code;

  String get code => _code;

  String? _symbol;

  String? get symbol => _symbol;

  int _precision;

  int get precision => _precision;

  String? _title;

  String? get title => _title;

  String _thousandSeparator;

  String get thousandSeparator => _thousandSeparator;

  String _decimalSeparator;

  String get decimalSeparator => _decimalSeparator;

  SymbolPlacement _symbolPlacement;

  SymbolPlacement get symbolPlacement => _symbolPlacement;

  static Currency? _currencyCache;

  static Currency _cached(String code) {
    if (code != _currencyCache?.code) {
      _currencyCache = null;
    }

    _currencyCache ??= Currencies.get(code);
    if (_currencyCache == null) {
      throw CurrencyException('Currency not found: "$code"');
    }
    return _currencyCache!;
  }

  Currency(String code, [CurrencyFormat? format])
      : _code = code,
        _symbol = _cached(code).symbol,
        _precision = _cached(code).precision,
        _title = _cached(code).title,
        _thousandSeparator = _cached(code).thousandSeparator,
        _decimalSeparator = _cached(code).decimalSeparator,
        _symbolPlacement = _cached(code).symbolPlacement;

  bool get hasThousandSeparator => thousandSeparator.isNotEmpty;

  bool get hasDecimalSeparator => decimalSeparator.isNotEmpty;

  Currency.fromMap(Map<String, dynamic> map)
      : _code = map['code'],
        _title = map['title'],
        _symbol = map['symbol'],
        _precision = map['precision'],
        _thousandSeparator = map['thousandSeparator'],
        _decimalSeparator = map['decimalSeparator'],
        _symbolPlacement = map['symbolPlacement'];

  @override
  String toString() => '$_title ($_code)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          _code == other._code;

  @override
  int get hashCode => _code.hashCode;
}
