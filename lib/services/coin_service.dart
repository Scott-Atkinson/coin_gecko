import 'package:coin_gecko/api/api_client.dart';
import 'package:coin_gecko/app/app.locator.dart';
import 'package:coin_gecko/models/coin.dart';
import 'package:coin_gecko/services/hive_service.dart';

class CoinService {
  final _apiClient = locator<ApiClient>();
  final _hiveService = locator<HiveService>();

  // Method to fetch all coins and return a list of Coin models
  Future<List<Coin>> fetchAllCoins() async {
    try {
      final response = await _apiClient.coinGeckoUrl.get<dynamic>(
        '/api/v3/coins/markets?vs_currency=usd',
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data ?? [];

        // Fetch all favorites from Hive
        final favorites = await _hiveService.getFavorites();

        // Extract the IDs of the favorite coins
        final favoriteIds = favorites.map((coin) => coin.id).toSet();

        // Map API response to Coin objects and update isFavorite
        return data.map((coinJson) {
          final coin = Coin.fromJson(coinJson);
          coin.isFavorite = favoriteIds.contains(coin.id);
          return coin;
        }).toList();
      } else {
        throw Exception('The request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch coins: $e');
    }
  }

  Future<void> favouiteCoin(Coin coin) async {
    await _hiveService.createFavorite(coin.id, coin.toJson());
  }

  Future<void> unFavouiteCoin(Coin coin) async {
    await _hiveService.deleteFavorite(coin.id);
  }
}
