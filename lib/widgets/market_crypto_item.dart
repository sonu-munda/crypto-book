import 'package:cryptotrack/models/crypto_model.dart';
import 'package:cryptotrack/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoMarketHeader extends StatelessWidget {
  const CryptoMarketHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textstyle =
        GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500);
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Palates.border))),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "#",
            style: textstyle,
          ),
          const SizedBox(width: 16),
          Expanded(flex: 3, child: Text("Coin", style: textstyle)),
          const SizedBox(width: 16),
          Expanded(
              flex: 3,
              child: Text(
                "Price",
                textAlign: TextAlign.end,
                style: textstyle,
              )),
          const SizedBox(width: 16),
          const Expanded(
              child: Text(
            "1h",
            textAlign: TextAlign.end,
          )),
        ],
      ),
    );
  }
}

class CryptoMarketItem extends StatelessWidget {
  const CryptoMarketItem({super.key, this.currency, this.onTap});

  final Cryptocurrency? currency;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Palates.border))),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "${currency!.marketCapRank!}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Image.network(
                      currency!.image!,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currency!.name!,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            currency!.symbol!,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(width: 16),
            Expanded(
                flex: 2,
                child: Text(
                  "₹${currency!.currentPrice!}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Text(
                "${currency!.priceChangePercentage24h.toStringAsFixed(1)!}%",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: currency!.priceChangePercentage24h < 0
                        ? Palates.red
                        : Palates.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
