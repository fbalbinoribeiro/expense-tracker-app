import 'package:expense_tracker_app/features/category_selector.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class AmountSelector extends StatefulWidget {
  const AmountSelector({super.key});

  @override
  State<AmountSelector> createState() => _AmountSelectorState();
}

class _AmountSelectorState extends State<AmountSelector> {
  @override
  void initState() {
    super.initState();
    _resetAmount();
  }

  void _resetAmount() {
    _controller.text = '1.00';
  }

  final TextEditingController _controller = TextEditingController(text: '1.00');
  final quickAmounts = [1, 2, 5, 10, 20, 50, 100, 200, 500];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addAmount(int amount) {
    final current =
        double.tryParse(_controller.text.replaceAll(',', '.')) ?? 0.0;
    final newValue = current + amount;
    _controller.text = newValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/icon/app_icon_transparent.png'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'R\$',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textAlign: TextAlign.right,
                    readOnly: true,
                  ),
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
                  onPressed: () => _addAmount(amount),
                  child: Text(amount.toString()),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: _resetAmount,
                    child: Text(
                      AppLocalizations.of(context).clear,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      final amount =
                          double.tryParse(
                            _controller.text.replaceAll(RegExp(r'[^0-9.]'), ''),
                          ) ??
                          1.0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategorySelector(amount: amount),
                        ),
                      );
                    },
                    child: const Text('OK', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
