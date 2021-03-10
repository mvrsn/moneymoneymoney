import 'package:moneymoneymoney/src/currency.dart';
import 'package:moneymoneymoney/src/placement.dart';

class Currencies {
  static Currency /*?*/ get(String code) {
    var map = _currencies[code.toUpperCase()];

    if (map == null) {
      return null;
    }

    return Currency.fromMap(map);
  }

  static List<Currency> get all =>
      _currencies.values.map((map) => Currency.fromMap(map)).toList();

  void addCurrency(String code, currency) => _currencies[code] = currency;

  bool hasCurrency(String code) => _currencies[code] != null;

  /// Utility function for finding currencies in a string
  /// Some symbols are used in more than one language so
  /// it's very / possible that there will be conflicts
  static List<Currency> unreliablyFindPotentialMatches(String input) {
    return all.where((currency) {
      if (currency.symbol == null) {
        return input.contains(currency.code);
      }

      // Avoid conflicts with other currencies that contain $ by checking
      // if the $ is the first character in the input
      if (['BWP', 'GTQ', 'HNL', 'ZAR', 'SZL', 'USD'].contains(currency.code)) {
        return input.indexOf(currency.symbol) == 0 || input.contains(currency.code);
      }

      return input.contains(currency.symbol) || input.contains(currency.code);
    }).toList();
  }
}

final _currencies = {
  'NGN': {
    'code': 'NGN',
    'title': 'Nigerian Naira',
    'symbol': '₦',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'ARS': {
    'code': 'ARS',
    'title': 'Argentine Peso',
    'symbol': 'AR\$',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'AMD': {
    'code': 'AMD',
    'title': 'Armenian Dram',
    'symbol': 'Դ',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'AWG': {
    'code': 'AWG',
    'title': 'Aruban Guilder',
    'symbol': 'Afl. ',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'AUD': {
    'code': 'AUD',
    'title': 'Australian Dollar',
    'symbol': 'AU\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BSD': {
    'code': 'BSD',
    'title': 'Bahamian Dollar',
    'symbol': 'B\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BHD': {
    'code': 'BHD',
    'title': 'Bahraini Dinar',
    'symbol': null,
    'precision': 3,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BDT': {
    'code': 'BDT',
    'title': 'Bangladesh, Taka',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BZD': {
    'code': 'BZD',
    'title': 'Belize Dollar',
    'symbol': 'BZ\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BMD': {
    'code': 'BMD',
    'title': 'Bermudian Dollar',
    'symbol': 'BD\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BOB': {
    'code': 'BOB',
    'title': 'Bolivia, Boliviano',
    'symbol': 'Bs',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BAM': {
    'code': 'BAM',
    'title': 'Bosnia and Herzegovina convertible mark',
    'symbol': 'KM ',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BWP': {
    'code': 'BWP',
    'title': 'Botswana, Pula',
    'symbol': 'p',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BRL': {
    'code': 'BRL',
    'title': 'Brazilian Real',
    'symbol': 'R\$',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'BND': {
    'code': 'BND',
    'title': 'Brunei Dollar',
    'symbol': 'B\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CAD': {
    'code': 'CAD',
    'title': 'Canadian Dollar',
    'symbol': 'CA\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'KYD': {
    'code': 'KYD',
    'title': 'Cayman Islands Dollar',
    'symbol': 'CI\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CLP': {
    'code': 'CLP',
    'title': 'Chilean Peso',
    'symbol': 'CLP\$',
    'precision': 0,
    'thousandSeparator': '.',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CNY': {
    'code': 'CNY',
    'title': 'China Yuan Renminbi',
    'symbol': 'CN¥',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'COP': {
    'code': 'COP',
    'title': 'Colombian Peso',
    'symbol': 'COL\$',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CRC': {
    'code': 'CRC',
    'title': 'Costa Rican Colon',
    'symbol': '₡',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'HRK': {
    'code': 'HRK',
    'title': 'Croatian Kuna',
    'symbol': ' kn',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'CUC': {
    'code': 'CUC',
    'title': 'Cuban Convertible Peso',
    'symbol': 'CUC\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CUP': {
    'code': 'CUP',
    'title': 'Cuban Peso',
    'symbol': 'CUP\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CYP': {
    'code': 'CYP',
    'title': 'Cyprus Pound',
    'symbol': '£',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'CZK': {
    'code': 'CZK',
    'title': 'Czech Koruna',
    'symbol': ' Kč',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'DKK': {
    'code': 'DKK',
    'title': 'Danish Krone',
    'symbol': ' kr.',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'DOP': {
    'code': 'DOP',
    'title': 'Dominican Peso',
    'symbol': 'RD\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'XCD': {
    'code': 'XCD',
    'title': 'East Caribbean Dollar',
    'symbol': 'EC\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'EGP': {
    'code': 'EGP',
    'title': 'Egyptian Pound',
    'symbol': 'EGP',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'SVC': {
    'code': 'SVC',
    'title': 'El Salvador Colon',
    'symbol': '₡',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'EUR': {
    'code': 'EUR',
    'title': 'Euro',
    'symbol': '€',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'GHC': {
    'code': 'GHC',
    'title': 'Ghana, Cedi',
    'symbol': 'GH₵',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'GIP': {
    'code': 'GIP',
    'title': 'Gibraltar Pound',
    'symbol': '£',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'GTQ': {
    'code': 'GTQ',
    'title': 'Guatemala, Quetzal',
    'symbol': 'Q',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'HNL': {
    'code': 'HNL',
    'title': 'Honduras, Lempira',
    'symbol': 'L',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'HKD': {
    'code': 'HKD',
    'title': 'Hong Kong Dollar',
    'symbol': 'HK\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'HUF': {
    'code': 'HUF',
    'title': 'Hungary, Forint',
    'symbol': ' Ft',
    'precision': 0,
    'thousandSeparator': ' ',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.after,
  },
  'ISK': {
    'code': 'ISK',
    'title': 'Iceland Krona',
    'symbol': ' kr',
    'precision': 0,
    'thousandSeparator': '.',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.after,
  },
  'INR': {
    'code': 'INR',
    'title': 'Indian Rupee ₹',
    'symbol': '₹',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'IDR': {
    'code': 'IDR',
    'title': 'Indonesia, Rupiah',
    'symbol': 'Rp',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'IRR': {
    'code': 'IRR',
    'title': 'Iranian Rial',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'JMD': {
    'code': 'JMD',
    'title': 'Jamaican Dollar',
    'symbol': 'J\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'JPY': {
    'code': 'JPY',
    'title': 'Japan, Yen',
    'symbol': '¥',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'JOD': {
    'code': 'JOD',
    'title': 'Jordanian Dinar',
    'symbol': null,
    'precision': 3,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'KES': {
    'code': 'KES',
    'title': 'Kenyan Shilling',
    'symbol': 'KSh',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'KWD': {
    'code': 'KWD',
    'title': 'Kuwaiti Dinar',
    'symbol': 'K.D.',
    'precision': 3,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'KZT': {
    'code': 'KZT',
    'title': 'Kazakh tenge',
    'symbol': '₸',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'LVL': {
    'code': 'LVL',
    'title': 'Latvian Lats',
    'symbol': 'Ls',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'LBP': {
    'code': 'LBP',
    'title': 'Lebanese Pound',
    'symbol': 'LBP',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'LTL': {
    'code': 'LTL',
    'title': 'Lithuanian Litas',
    'symbol': ' Lt',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'MKD': {
    'code': 'MKD',
    'title': 'Macedonia, Denar',
    'symbol': 'ден ',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'MYR': {
    'code': 'MYR',
    'title': 'Malaysian Ringgit',
    'symbol': 'RM',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'MTL': {
    'code': 'MTL',
    'title': 'Maltese Lira',
    'symbol': 'Lm',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'MUR': {
    'code': 'MUR',
    'title': 'Mauritius Rupee',
    'symbol': 'Rs',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'MXN': {
    'code': 'MXN',
    'title': 'Mexican Peso',
    'symbol': 'MX\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'MZM': {
    'code': 'MZM',
    'title': 'Mozambique Metical',
    'symbol': 'MT',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'NPR': {
    'code': 'NPR',
    'title': 'Nepalese Rupee',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'ANG': {
    'code': 'ANG',
    'title': 'Netherlands Antillian Guilder',
    'symbol': 'NAƒ ',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'ILS': {
    'code': 'ILS',
    'title': 'New Israeli Shekel ₪',
    'symbol': ' ₪',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.after,
  },
  'TRY': {
    'code': 'TRY',
    'title': 'New Turkish Lira',
    'symbol': '₺',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'NZD': {
    'code': 'NZD',
    'title': 'New Zealand Dollar',
    'symbol': 'NZ\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'NOK': {
    'code': 'NOK',
    'title': 'Norwegian Krone',
    'symbol': 'kr ',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'PKR': {
    'code': 'PKR',
    'title': 'Pakistan Rupee',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'PEN': {
    'code': 'PEN',
    'title': 'Peru, Nuevo Sol',
    'symbol': 'S/.',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'UYU': {
    'code': 'UYU',
    'title': 'Peso Uruguayo',
    'symbol': '\$U ',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'PHP': {
    'code': 'PHP',
    'title': 'Philippine Peso',
    'symbol': '₱',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'PLN': {
    'code': 'PLN',
    'title': 'Poland, Zloty',
    'symbol': ' zł',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'GBP': {
    'code': 'GBP',
    'title': 'Pound Sterling',
    'symbol': '£',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'OMR': {
    'code': 'OMR',
    'title': 'Rial Omani',
    'symbol': 'OMR',
    'precision': 3,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'RON': {
    'code': 'RON',
    'title': 'Romania, New Leu',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'ROL': {
    'code': 'ROL',
    'title': 'Romania, Old Leu',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'RUB': {
    'code': 'RUB',
    'title': 'Russian Ruble',
    'symbol': ' ₽',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'SAR': {
    'code': 'SAR',
    'title': 'Saudi Riyal',
    'symbol': 'SAR',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'SGD': {
    'code': 'SGD',
    'title': 'Singapore Dollar',
    'symbol': 'S\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'SKK': {
    'code': 'SKK',
    'title': 'Slovak Koruna',
    'symbol': ' SKK',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'SIT': {
    'code': 'SIT',
    'title': 'Slovenia, Tolar',
    'symbol': null,
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'ZAR': {
    'code': 'ZAR',
    'title': 'South Africa, Rand',
    'symbol': 'R',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'KRW': {
    'code': 'KRW',
    'title': 'South Korea, Won ₩',
    'symbol': '₩',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'SZL': {
    'code': 'SZL',
    'title': 'Swaziland, Lilangeni',
    'symbol': 'E',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'SEK': {
    'code': 'SEK',
    'title': 'Swedish Krona',
    'symbol': ' kr',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'CHF': {
    'code': 'CHF',
    'title': 'Swiss Franc',
    'symbol': 'SFr ',
    'precision': 2,
    'thousandSeparator': '\'',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'TZS': {
    'code': 'TZS',
    'title': 'Tanzanian Shilling',
    'symbol': 'TSh',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'THB': {
    'code': 'THB',
    'title': 'Thailand, Baht ฿',
    'symbol': '฿',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'TOP': {
    'code': 'TOP',
    'title': 'Tonga, Paanga',
    'symbol': 'T\$ ',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'AED': {
    'code': 'AED',
    'title': 'UAE Dirham',
    'symbol': 'AED',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'UAH': {
    'code': 'UAH',
    'title': 'Ukraine, Hryvnia',
    'symbol': ' ₴',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.after,
  },
  'USD': {
    'code': 'USD',
    'title': 'US Dollar',
    'symbol': '\$',
    'precision': 2,
    'thousandSeparator': ',',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
  'VUV': {
    'code': 'VUV',
    'title': 'Vanuatu, Vatu',
    'symbol': 'VT',
    'precision': 0,
    'thousandSeparator': ',',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.before,
  },
  'VEF': {
    'code': 'VEF',
    'title': 'Venezuela Bolivares Fuertes',
    'symbol': 'Bs.',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'VEB': {
    'code': 'VEB',
    'title': 'Venezuela, Bolivar',
    'symbol': 'Bs.',
    'precision': 2,
    'thousandSeparator': '.',
    'decimalSeparator': ',',
    'symbolPlacement': SymbolPlacement.before,
  },
  'VND': {
    'code': 'VND',
    'title': 'Viet Nam, Dong ₫',
    'symbol': ' ₫',
    'precision': 0,
    'thousandSeparator': '.',
    'decimalSeparator': '',
    'symbolPlacement': SymbolPlacement.after,
  },
  'ZWD': {
    'code': 'ZWD',
    'title': 'Zimbabwe Dollar',
    'symbol': 'Z\$',
    'precision': 2,
    'thousandSeparator': ' ',
    'decimalSeparator': '.',
    'symbolPlacement': SymbolPlacement.before,
  },
};
