import 'package:cryptotrack/bloc/crypto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/crypto_repository.dart';
import 'crypto_events.dart';

class CryptoListBloc extends Bloc<CryptoEvent, CryptoListState> {
  CryptoListBloc(this._repository) : super(const CryptoListState()) {
    on<FetchCryptoCurrencies>(fetchCryptoCurrencies);
  }
  final CryptoRepository _repository;

  void fetchCryptoCurrencies(
      FetchCryptoCurrencies event, Emitter<CryptoListState> emit) async {
    try {
      final res = await _repository.fetchCryptoCurrencies(
          "?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en");
      emit(state.copyWith(
        status: CryptoState.success,
        currencies: res,
      ));
    } catch (e) {
      emit(state.copyWith(status: CryptoState.failure));
    }
  }
}
