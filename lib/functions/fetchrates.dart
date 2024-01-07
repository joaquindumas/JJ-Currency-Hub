import 'package:currency_converter/models/allcurrencies.dart';
import 'package:currency_converter/models/ratesModel.dart';
import 'package:currency_converter/utils/key.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async {
  var response = await http.get(
      Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + key));

  if (response.statusCode == 200) {
    final result = ratesModelFromJson(response.body);
    return result;
  } else {
    throw Exception('Failed to load exchange rates');
  }
}

Future<Map> fetchcurrencies() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?app_id=' + key));

  if (response.statusCode == 200) {
    final allcurrencies = allCurrenciesFromJson(response.body);
    return allcurrencies;
  } else {
    throw Exception('Failed to load currencies');
  }
}

String convertphp(Map exchangeRates, String php, String currency) {
  String output =
  ((1 / exchangeRates['PHP']) * double.parse(php) * exchangeRates[currency])
      .toStringAsFixed(2);
  return output;
}

String convertany(Map exchangeRates, String amount, String currencybase,
    String currencyfinal) {
  String output = (double.parse(amount) /
      exchangeRates[currencybase] *
      exchangeRates[currencyfinal])
      .toStringAsFixed(2)
      .toString();
  return output;
}
