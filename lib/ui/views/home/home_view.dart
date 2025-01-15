import 'package:coin_gecko/ui/common/app_strings.dart';
import 'package:coin_gecko/widgets/coin_item.dart';
import 'package:coin_gecko/widgets/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:coin_gecko/ui/common/app_colors.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        // backgroundColor: kcBackgroundColor,
        title: const Text(
          ksAppBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await viewModel.refreshCoins();
            },
            icon: const Icon(
              Icons.refresh,
              color: kcLightGrey,
            ),
          ),
        ],
      ),
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // Search TextField
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => viewModel.filterCoins(value),
                style: const TextStyle(color: kcWhite),
                decoration: InputDecoration(
                  hintText: ksSearchCoin,
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                ),
              ),
            ),
            Expanded(
              child: viewModel.isBusy
                  ? const ShimmerLoader()
                  : viewModel.filteredCoins.isEmpty
                      ? const Center(
                          child: Text(
                            ksNoCoinsAvailable,
                            style: TextStyle(color: kcWhite, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: viewModel.filteredCoins.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.filteredCoins[index];
                            return CoinItem(
                              coinId: item.id,
                              imageUrl: item.image,
                              name: item.name,
                              symbol: item.symbol,
                              price: item.currentPrice,
                              percentageChange: item.priceChangePercentage24h,
                              isFavorite: item.isFavorite,
                              onCoinSelected: viewModel.coinSelected,
                              onFavoriteSelected: viewModel.toggleFavorite,
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
