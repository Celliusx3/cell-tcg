import 'package:intl/intl.dart';

class StringUtils {
  static toCurrencyText(String locale, double amount) {
    String displayText = "$locale $amount";
    try {
      displayText =  NumberFormat.simpleCurrency(locale: locale).format(amount);
    } catch (e) {}
    return displayText;

  }
}