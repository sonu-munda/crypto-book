import 'package:cryptotrack/bloc/crypto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/crypto_repository.dart';
import 'crypto_events.dart';

class CryptoDetailBloc extends Bloc<CryptoEvent, CryptoDetailState> {
  CryptoDetailBloc(this._repository)
      : super(const CryptoDetailState(status: CryptoState.initial)) {
    on<FetchCryptoCurrencyDetail>(_fetchCryptoDetail);
  }

  final CryptoRepository _repository;

  void _fetchCryptoDetail(
      FetchCryptoCurrencyDetail event, Emitter<CryptoDetailState> emit) async {
    try {
      // Fetch Data from Repository
      // final res = await _repository.fetchCurrencyDetail(
      //     "${event.currency.id}?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false");

      emit(state.copyWith(
        status: CryptoState.success,
        cryptocurrency: event.currency,
      ));
    } catch (e) {
      emit(state.copyWith(status: CryptoState.failure));
    }
  }
}
