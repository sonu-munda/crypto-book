import 'package:equatable/equatable.dart';

import '../models/crypto_model.dart';

enum CryptoState { initial, success, failure }

sealed class CryptoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCryptoCurrencies extends CryptoEvent {}

class FetchCryptoCurrencyDetail extends CryptoEvent {
  final Cryptocurrency currency;

  FetchCryptoCurrencyDetail(this.currency);
}
