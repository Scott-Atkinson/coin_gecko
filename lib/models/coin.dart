import 'package:coin_gecko/models/roi.dart';

class Coin {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double fullyDilutedValuation;
  final double totalVolume;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCapChange24h;
  final double marketCapChangePercentage24h;
  final double circulatingSupply;
  final double totalSupply;
  final double? maxSupply;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
  final DateTime atlDate;
  final Roi? roi;
  final DateTime lastUpdated;
  bool isFavorite;

  Coin({required this.id, required this.symbol, required this.name, required this.image, required this.currentPrice, required this.marketCap, required this.marketCapRank, required this.fullyDilutedValuation, required this.totalVolume, required this.high24h, required this.low24h, required this.priceChange24h, required this.priceChangePercentage24h, required this.marketCapChange24h, required this.marketCapChangePercentage24h, required this.circulatingSupply, required this.totalSupply, required this.maxSupply, required this.ath, required this.athChangePercentage, required this.athDate, required this.atl, required this.atlChangePercentage, required this.atlDate, required this.roi, required this.lastUpdated, required this.isFavorite});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        id: json['id'] as String,
        symbol: json['symbol'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        currentPrice: (json['current_price'] as num).toDouble(),
        marketCap: (json['market_cap'] as num).toDouble(),
        marketCapRank: json['market_cap_rank'] as int,
        fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toDouble() ?? 0.0,
        totalVolume: (json['total_volume'] as num).toDouble(),
        high24h: (json['high_24h'] as num).toDouble(),
        low24h: (json['low_24h'] as num).toDouble(),
        priceChange24h: (json['price_change_24h'] as num).toDouble(),
        priceChangePercentage24h: (json['price_change_percentage_24h'] as num).toDouble(),
        marketCapChange24h: (json['market_cap_change_24h'] as num).toDouble(),
        marketCapChangePercentage24h: (json['market_cap_change_percentage_24h'] as num).toDouble(),
        circulatingSupply: (json['circulating_supply'] as num).toDouble(),
        totalSupply: (json['total_supply'] as num).toDouble(),
        maxSupply: (json['max_supply'] as num?)?.toDouble(),
        ath: (json['ath'] as num).toDouble(),
        athChangePercentage: (json['ath_change_percentage'] as num).toDouble(),
        athDate: DateTime.parse(json['ath_date']),
        atl: (json['atl'] as num).toDouble(),
        atlChangePercentage: (json['atl_change_percentage'] as num).toDouble(),
        atlDate: DateTime.parse(json['atl_date']),
        roi: json['roi'] != null ? Roi.fromJson(json['roi']) : null,
        lastUpdated: DateTime.parse(json['last_updated']),
        isFavorite: false);
  }

  /// Convert a `Coin` object into a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap': marketCap,
      'market_cap_rank': marketCapRank,
      'fully_diluted_valuation': fullyDilutedValuation,
      'total_volume': totalVolume,
      'high_24h': high24h,
      'low_24h': low24h,
      'price_change_24h': priceChange24h,
      'price_change_percentage_24h': priceChangePercentage24h,
      'market_cap_change_24h': marketCapChange24h,
      'market_cap_change_percentage_24h': marketCapChangePercentage24h,
      'circulating_supply': circulatingSupply,
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'ath': ath,
      'ath_change_percentage': athChangePercentage,
      'ath_date': athDate.toIso8601String(),
      'atl': atl,
      'atl_change_percentage': atlChangePercentage,
      'atl_date': atlDate.toIso8601String(),
      'roi': roi?.toJson(), // Ensure Roi also has a toJson method
      'last_updated': lastUpdated.toIso8601String(),
      'is_favorite': isFavorite,
    };
  }
}
