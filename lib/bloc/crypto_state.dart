import 'package:cryptotrack/models/crypto_model.dart';
import 'package:equatable/equatable.dart';

import 'crypto_events.dart';

final class CryptoListState extends Equatable {
  const CryptoListState({
    this.status = CryptoState.initial,
    this.currencies = const <Cryptocurrency>[],
  });

  final CryptoState status;
  final List<Cryptocurrency> currencies;

  CryptoListState copyWith({
    CryptoState? status,
    List<Cryptocurrency>? currencies,
    bool? hasReachedMax,
  }) {
    return CryptoListState(
      status: status ?? this.status,
      currencies: currencies ?? this.currencies,
    );
  }

  @override
  String toString() {
    return '''Crypto currencies { status: $status,  currencies: ${currencies.length} }''';
  }

  @override
  List<Object> get props => [status, currencies];
}

final class CryptoDetailState extends Equatable {
  final CryptoState status;
  final Cryptocurrency? cryptocurrency;
  const CryptoDetailState(
      {this.status = CryptoState.initial, this.cryptocurrency});

  CryptoDetailState copyWith({
    CryptoState? status,
    Cryptocurrency? cryptocurrency,
    bool? hasReachedMax,
  }) {
    return CryptoDetailState(
      status: status ?? this.status,
      cryptocurrency: cryptocurrency ?? this.cryptocurrency,
    );
  }

  @override
  List<Object?> get props => [status, cryptocurrency];
}
