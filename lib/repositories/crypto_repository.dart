import 'package:cryptotrack/api/crypto_apis.dart';
import 'package:cryptotrack/models/crypto_model.dart';

class CryptoRepository {
  final CryptoApi _api = CryptoApi();

  Future<List<Cryptocurrency>> fetchCryptoCurrencies([param]) async {
    final res = await _api.fetchCryptoCurrencies(param);
    return CryptocurrencyListResponse.fromJson(res).currencies;
  }

  Future<Cryptocurrency> fetchCurrencyDetail([param]) async {
    final res = await _api.fetchCryptoCurrencies(param);
    return Cryptocurrency.fromJson(res);
  }
}
