import 'package:cryptotrack/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/crypto_events.dart';
import '../bloc/crypto_state.dart';
import '../widgets/market_crypto_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CryptoListBloc>().add(FetchCryptoCurrencies());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text("CrytoTrack")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CryptoMarketHeader(),
          ),
          BlocBuilder<CryptoListBloc, CryptoListState>(
              builder: (context, state) {
            switch (state.status) {
              case CryptoState.failure:
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(child: Text('Failed to fetch')),
                );
              case CryptoState.success:
                if (state.currencies.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: Text('Empty')),
                  );
                }
                return Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.currencies.length,
                    itemBuilder: (_, i) => CryptoMarketItem(
                      currency: state.currencies[i],
                      onTap: () => GoRouter.of(context)
                          .push('/home/detail', extra: state.currencies[i]),
                    ),
                  ),
                );

              case CryptoState.initial:
                return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator());
            }
          }),
        ],
      ),
    );
  }
}
