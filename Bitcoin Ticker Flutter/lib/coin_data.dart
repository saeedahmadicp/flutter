import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'USD',
  'AUD',
  'ARL',
  'CAD',
  'CHF',
  'CLP',
  'CNY',
  'DKK',
  'EUR',
  'GBP',
  'HKD',
  'INR',
  'ISK',
  'JPY',
  'TWD',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  double currency;
  dynamic coinsData;

  CoinData() {
    getCurrencyData();
  }

  String url = 'https://blockchain.info/ticker';
  void getCurrencyData() async {
    http.Response response = await http.get(this.url);
    if (response.statusCode == 200) {
      String data = response.body;
      coinsData = jsonDecode(data);
    } else {
      print(response.statusCode);
      // print(response.statusCode);
    }
  }

  double getCurrencyExchange(String currency) {
    return coinsData[currency]['last'];
  }
}
