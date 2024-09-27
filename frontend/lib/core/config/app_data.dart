class AppData {
  static List currencyList = [
    {'currency': 'INR', 'name': 'Indian', 'flag': '🇮🇳', 'symbol': '₹'},
    {'currency': 'USD', 'name': 'US Dollar', 'flag': '🇺🇸', 'symbol': '\$'},
    {'currency': 'EUR', 'name': 'Euro', 'flag': '🇪🇺', 'symbol': '€'},
    {'currency': 'JPY', 'name': 'Japanese Yen', 'flag': '🇯🇵', 'symbol': '¥'},
    {'currency': 'GBP', 'name': 'British Pound', 'flag': '🇬🇧', 'symbol': '£'},
    {
      'currency': 'AUD',
      'name': 'Australian Dollar',
      'flag': '🇦🇺',
      'symbol': '\$'
    },
    {
      'currency': 'CAD',
      'name': 'Canadian Dollar',
      'flag': '🇨🇦',
      'symbol': '\$'
    },
    {'currency': 'CHF', 'name': 'Swiss Franc', 'flag': '🇨🇭', 'symbol': 'CHF'},
    {'currency': 'CNY', 'name': 'Chinese Yuan', 'flag': '🇨🇳', 'symbol': '¥'},
    {'currency': 'RUB', 'name': 'Russian Ruble', 'flag': '🇷🇺', 'symbol': '₽'},
    {
      'currency': 'BRL',
      'name': 'Brazilian Real',
      'flag': '🇧🇷',
      'symbol': 'R\$'
    },
    {
      'currency': 'ZAR',
      'name': 'South African Rand',
      'flag': '🇿🇦',
      'symbol': 'R'
    },
    {'currency': 'MXN', 'name': 'Mexican Peso', 'flag': '🇲🇽', 'symbol': '\$'},
    {
      'currency': 'SGD',
      'name': 'Singapore Dollar',
      'flag': '🇸🇬',
      'symbol': '\$'
    },
    {
      'currency': 'HKD',
      'name': 'Hong Kong Dollar',
      'flag': '🇭🇰',
      'symbol': '\$'
    },
    {
      'currency': 'NZD',
      'name': 'New Zealand Dollar',
      'flag': '🇳🇿',
      'symbol': '\$'
    },
    {
      'currency': 'KRW',
      'name': 'South Korean Won',
      'flag': '🇰🇷',
      'symbol': '₩'
    },
    {
      'currency': 'SEK',
      'name': 'Swedish Krona',
      'flag': '🇸🇪',
      'symbol': 'kr'
    },
    {
      'currency': 'NOK',
      'name': 'Norwegian Krone',
      'flag': '🇳🇴',
      'symbol': 'kr'
    },
    {'currency': 'DKK', 'name': 'Danish Krone', 'flag': '🇩🇰', 'symbol': 'kr'},
    {'currency': 'TRY', 'name': 'Turkish Lira', 'flag': '🇹🇷', 'symbol': '₺'},
    {'currency': 'THB', 'name': 'Thai Baht', 'flag': '🇹🇭', 'symbol': '฿'},
    {
      'currency': 'MYR',
      'name': 'Malaysian Ringgit',
      'flag': '🇲🇾',
      'symbol': 'RM'
    },
    {
      'currency': 'PHP',
      'name': 'Philippine Peso',
      'flag': '🇵🇭',
      'symbol': '₱'
    },
    {
      'currency': 'IDR',
      'name': 'Indonesian Rupiah',
      'flag': '🇮🇩',
      'symbol': 'Rp'
    },
    {'currency': 'PLN', 'name': 'Polish Zloty', 'flag': '🇵🇱', 'symbol': 'zł'},
    {'currency': 'CZK', 'name': 'Czech Koruna', 'flag': '🇨🇿', 'symbol': 'Kč'},
    {
      'currency': 'HUF',
      'name': 'Hungarian Forint',
      'flag': '🇭🇺',
      'symbol': 'Ft'
    },
    {
      'currency': 'AED',
      'name': 'United Arab Emirates Dirham',
      'flag': '🇦🇪',
      'symbol': 'د.إ'
    },
    {'currency': 'SAR', 'name': 'Saudi Riyal', 'flag': '🇸🇦', 'symbol': 'ر.س'},
    {
      'currency': 'EGP',
      'name': 'Egyptian Pound',
      'flag': '🇪🇬',
      'symbol': '£'
    },
    {
      'currency': 'ILS',
      'name': 'Israeli New Shekel',
      'flag': '🇮🇱',
      'symbol': '₪'
    },
  ];

  static String getCurrencySymbol(String name) {
    String currency = "";
    for (var i in currencyList) {
      if (name == i['currency']) {
        currency = i['symbol'];
      }
    }

    return currency;
  }
}
