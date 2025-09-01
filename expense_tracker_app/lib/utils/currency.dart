import 'package:intl/intl.dart';

const kCurrencySymbol = 'R\$';
const kCurrencyLocale = 'pt_BR';

final kCurrencyFormatter = NumberFormat.currency(
  locale: kCurrencyLocale,
  symbol: kCurrencySymbol,
);
