import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double preco) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(preco);
  }
}
