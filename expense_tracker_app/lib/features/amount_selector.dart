import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AmountSelector extends StatelessWidget {
  const AmountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final quickAmounts = [1, 2, 5, 10, 20, 50, 100, 200, 500];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              CurrencyTextInputFormatter.currency(
                locale: 'pt_BR',
                symbol: 'R\$ ',
                decimalDigits: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: quickAmounts.map((amount) {
            return SizedBox(
              width: 100,
              height: 60,
              child: ElevatedButton(
                onPressed: null, // No interaction for now
                child: Text(amount.toString()),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                height: 60,
                child: OutlinedButton(
                  onPressed: null, // No interaction for now
                  child: const Text('Clear', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(
                width: 140,
                height: 60,
                child: ElevatedButton(
                  onPressed: null, // No interaction for now
                  child: const Text('OK', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
