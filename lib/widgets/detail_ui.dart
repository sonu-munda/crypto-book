import 'package:cryptotrack/models/crypto_model.dart';
import 'package:cryptotrack/utils/consts.dart';
import 'package:cryptotrack/utils/extensions.dart';
import 'package:flutter/material.dart';

class CryptoDetailUi extends StatelessWidget {
  const CryptoDetailUi({
    super.key,
    required this.currency,
  });

  final Cryptocurrency? currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: Palates.black, borderRadius: BorderRadius.circular(4)),
            child: Text(
              "Rank #${currency!.marketCapRank!}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Palates.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                currency!.image!,
                height: 28,
              ),
              const SizedBox(width: 8),
              Text(
                currency!.name!,
                maxLines: 1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(width: 8),
              Text(
                currency!.symbol!,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹${currency!.currentPrice!.toString().toFigure()}",
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(width: 8),
              Icon(
                currency!.priceChangePercentage24h < 0
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                color: currency!.priceChangePercentage24h < 0
                    ? Palates.red
                    : Palates.green,
              ),
              Text(
                "${currency!.priceChangePercentage24h!.toStringAsFixed(2)}%",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: currency!.priceChangePercentage24h < 0
                        ? Palates.red
                        : Palates.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 4,
            decoration: BoxDecoration(
                color: Palates.border.withOpacity(.2),
                borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹${currency!.low24h.toString().toFigure()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const Text(
                "24H Range",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Text(
                "₹${currency!.high24h.toString().toFigure()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TradeItem(
            label: "Market Cap",
            number: "₹${currency!.marketCap!}",
          ),
          TradeItem(
            label: "24 Hour Trading Vol",
            number: "₹${currency!.totalVolume!}",
          ),
          TradeItem(
            label: "Fully Diluted Valuation",
            number: "₹${currency!.fullyDilutedValuation ?? '-'}",
          ),
          TradeItem(
            label: "Circulating Supply",
            number: "${currency!.circulatingSupply!}",
          ),
          TradeItem(
            label: "Total Supply",
            number: "${currency!.totalSupply ?? '-'}",
          ),
          TradeItem(
            label: "Max Supply",
            number: "${currency!.maxSupply ?? '-'}",
          ),
          TradeItem(
            label: "Volume / Market Cap",
            number:
                "${(currency!.totalVolume / currency!.marketCap).toStringAsFixed(4)}",
          ),
          TradeItem(
            label: "Max Supply",
            number: "${currency!.maxSupply ?? '-'}",
          ),
        ],
      ),
    );
  }
}

class TradeItem extends StatelessWidget {
  const TradeItem({super.key, this.number, this.label});
  final String? number;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Palates.border))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label!,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          Text(
            number!.toFigure(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
