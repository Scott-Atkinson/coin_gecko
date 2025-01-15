import 'package:coin_gecko/api/api_client.dart';
import 'package:coin_gecko/app/app.locator.dart';
import 'package:coin_gecko/models/coin.dart';

class CoinService {
  final _apiClient = locator<ApiClient>();

  // Method to fetch all coins and return a list of Coin models
  Future<List<Coin>> fetchAllCoins() async {
    try {
      final response = await _apiClient.coinGeckoUrl.get<dynamic>(
        '/api/v3/coins/markets?vs_currency=usd',
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data ?? [];

        return data.map((coinJson) => Coin.fromJson(coinJson)).toList();
      } else {
        throw Exception('Failed to load coins');
      }
    } catch (e) {
      throw Exception('Failed to fetch coins: $e');
    }
  }
}
