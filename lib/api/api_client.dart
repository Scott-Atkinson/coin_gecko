import 'package:dio/dio.dart';

/// Very lightweight API client which is used to stored base urls, this can be extended to also include interceptors, headers, etc.
class ApiClient {
  late final Dio coinGeckoUrl;

  ApiClient() {
    coinGeckoUrl = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com',
      ),
    );
  }
}
