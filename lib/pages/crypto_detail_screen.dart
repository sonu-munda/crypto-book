import 'package:cryptotrack/bloc/crypto_detail_bloc.dart';
import 'package:cryptotrack/bloc/crypto_state.dart';
import 'package:cryptotrack/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/crypto_events.dart';
import '../widgets/detail_ui.dart';

class CryptocurrencyDetailScreen extends StatefulWidget {
  const CryptocurrencyDetailScreen({super.key, required this.currency});
  final Cryptocurrency currency;

  @override
  State<CryptocurrencyDetailScreen> createState() =>
      _CryptocurrencyDetailScreenState();
}

class _CryptocurrencyDetailScreenState
    extends State<CryptocurrencyDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<CryptoDetailBloc>()
          .add(FetchCryptoCurrencyDetail(widget.currency));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.currency.name!)),
      body: BlocBuilder<CryptoDetailBloc, CryptoDetailState>(
          builder: (context, state) {
        switch (state.status) {
          case CryptoState.failure:
            return const Center(child: Text('Failed to fetch'));
          case CryptoState.success:
            return CryptoDetailUi(currency: state.cryptocurrency);
          case CryptoState.initial:
            return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
