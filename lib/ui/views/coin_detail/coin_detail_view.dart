import 'package:coin_gecko/models/coin.dart';
import 'package:coin_gecko/ui/common/app_colors.dart';
import 'package:coin_gecko/ui/common/app_strings.dart';
import 'package:coin_gecko/widgets/chart_data.dart';
import 'package:coin_gecko/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'coin_detail_viewmodel.dart';

class CoinDetailView extends StackedView<CoinDetailViewModel> {
  const CoinDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoinDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          viewModel.coin.image,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back, color: kcWhite)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.star_border,
              color: viewModel.coin.isFavorite ? Colors.yellow : Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              viewModel.coin.name,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: kcWhite),
            ),
            const SizedBox(height: 8),
            Text(
              '1 ${viewModel.coin.symbol.toUpperCase()} = \$${viewModel.coin.currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kcWhite),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${viewModel.coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: viewModel.coin.priceChangePercentage24h >= 0
                        ? Colors.green
                        : Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  viewModel.coin.priceChangePercentage24h >= 0
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: viewModel.coin.priceChangePercentage24h >= 0
                      ? Colors.green
                      : Colors.red,
                  size: 16.0,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatTile(
                    title: ksVolume,
                    value:
                        "\$${NumberFormat('#,##0.00').format(viewModel.coin.totalVolume)}"),
                StatTile(
                    title: ksMarktCap,
                    value:
                        "\$${NumberFormat('#,##0.00').format(viewModel.coin.marketCap)}"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Chart Data
            const Expanded(child: ChartData()),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  @override
  CoinDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoinDetailViewModel(
          coin: ModalRoute.of(context)!.settings.arguments as Coin);
}
