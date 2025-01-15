import 'package:coin_gecko/models/coin.dart';
import 'package:hive/hive.dart';

class HiveService {
  final String favoritesBoxName = 'favorites';

  /// Opens the favorites box
  Future<Box> _openFavoritesBox() async {
    return await Hive.openBox(favoritesBoxName);
  }

  /// CREATE: Add a new item to the favorites box
  Future<void> createFavorite(String key, dynamic value) async {
    final box = await _openFavoritesBox();
    await box.put(key, value);
  }

  /// UPDATE: Update an existing item in the favorites box
  Future<void> updateFavorite(String key, dynamic newValue) async {
    final box = await _openFavoritesBox();
    if (box.containsKey(key)) {
      await box.put(key, newValue);
    } else {
      throw Exception("Key '$key' does not exist in favorites.");
    }
  }

  /// GET: Retrieve all items from the favorites box as a list
  Future<List<Coin>> getFavorites() async {
    final box = await _openFavoritesBox();

    // Return an empty list if the box has no values
    if (box.isEmpty) {
      return [];
    }

    // Map the stored values to a list of Coin objects
    return box.values.map((value) {
      return Coin.fromJson(Map<String, dynamic>.from(value));
    }).toList();
  }

  /// DELETE: Remove an item from the favorites box
  Future<void> deleteFavorite(String key) async {
    final box = await _openFavoritesBox();
    if (box.containsKey(key)) {
      await box.delete(key);
    } else {
      throw Exception("Key '$key' does not exist in favorites.");
    }
  }
}
