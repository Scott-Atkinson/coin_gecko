import 'package:coin_gecko/app/app.bottomsheets.dart';
import 'package:coin_gecko/app/app.locator.dart';
import 'package:coin_gecko/app/app.router.dart';
import 'package:coin_gecko/models/coin.dart';
import 'package:coin_gecko/services/coin_service.dart';
import 'package:coin_gecko/ui/common/app_strings.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _coinService = locator<CoinService>();
  final _navigationService = locator<NavigationService>();

  late List<Coin> coins = [];
  List<Coin> filteredCoins = [];

  Future<void> init() async {
    await fetchCoins();
  }

  Future<void> fetchCoins() async {
    setBusy(true);
    try {
      coins = await _coinService.fetchAllCoins();
      filterCoins('');
      rebuildUi();
    } catch (e) {
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.error,
        title: ksErrorBottomSheetTitle,
        description: ksErrorBottomSheetDescription,
      );
    }
    setBusy(false);
  }

  Future<void> coinSelected(String coinId) async {
    final coin = coins.firstWhere((coin) => coin.id == coinId);
    await _navigationService.navigateTo(Routes.coinDetailView, arguments: coin);
  }

  void filterCoins(String query) {
    if (query.isEmpty) {
      filteredCoins = List.from(coins);
    } else {
      filteredCoins = coins.where((coin) => coin.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    rebuildUi();
  }

  void toggleFavorite(String coinId) {
    final coinIndex = coins.indexWhere((coin) => coin.id == coinId);
    if (coinIndex != -1) {
      coins[coinIndex].isFavorite = !coins[coinIndex].isFavorite;
      rebuildUi();
    }
  }

  Future<void> refreshCoins() async {
    await fetchCoins();
  }
}
