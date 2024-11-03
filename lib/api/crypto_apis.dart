import 'package:cryptotrack/utils/apis.dart';

import '../utils/api_service.dart';

class CryptoApi {
  Future<dynamic> fetchCryptoCurrencies([param = ""]) async {
    try {
      String url = API.fetch_cryptocurrencies + param;
      final response =
          await ApiService.callApi(method: ApiService.GET, url: url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
