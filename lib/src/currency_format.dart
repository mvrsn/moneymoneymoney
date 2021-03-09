import 'package:moneymoneymoney/src/placement.dart';

class CurrencyFormat {
  String symbol;

  int precision;

  String title;

  String thousandSeparator;

  String decimalSeparator;

  SymbolPlacement symbolPlacement;

  CurrencyFormat({
    this.symbol = '',
    this.title,
    this.precision = 2,
    this.thousandSeparator = '.',
    this.decimalSeparator = ',',
    this.symbolPlacement = SymbolPlacement.before,
  });
}
