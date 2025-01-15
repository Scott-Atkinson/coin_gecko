import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_gecko/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinItem extends StatelessWidget {
  final String coinId;
  final String imageUrl;
  final String name;
  final String symbol;
  final double price;
  final double percentageChange;
  final bool isFavorite;
  final Function(String coinId) onCoinSelected;
  final Function(String coinId) onFavoriteSelected;

  const CoinItem({
    Key? key,
    required this.coinId,
    required this.imageUrl,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentageChange,
    required this.isFavorite,
    required this.onCoinSelected,
    required this.onFavoriteSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: InkWell(
            onTap: () {
              onCoinSelected(coinId);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Coin Image and Details
                  Expanded(
                    child: Row(
                      children: [
                        // Coin Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child:
                                  CircularProgressIndicator(strokeWidth: 2.0),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12.0),
                        // Name and Symbol
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                symbol.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Percentage Change and Price
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${percentageChange.toStringAsFixed(2)}%',
                            style: TextStyle(
                              color: percentageChange >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            percentageChange >= 0
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: percentageChange >= 0
                                ? Colors.green
                                : Colors.red,
                            size: 16.0,
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      // Price
                      Text(
                        '\$${NumberFormat('#,##0.00').format(price)}',
                        style: const TextStyle(
                          color: kcWhite,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Favorite Icon
        Positioned(
          top: 4.0, // Adjust as needed
          right: 4.0, // Adjust as needed
          child: InkWell(
            onTap: () {
              onFavoriteSelected(coinId);
            },
            child: Icon(
              Icons.star,
              size: 24,
              color: isFavorite ? Colors.yellow : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
