import 'package:expense_tracker_app/features/amount_selector.dart';
import 'package:expense_tracker_app/features/expenses_summary.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() async {
  // debugPaintSizeEnabled = true; // Outlines boxes
  // debugPaintBaselinesEnabled = true; // Shows text baselines
  // debugPaintPointersEnabled = true; // Highlights touch areas
  // debugPaintLayerBordersEnabled = true; // Outlines composited layers
  // debugRepaintRainbowEnabled = true; // Flashes repaint regions

  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amount Selector',
      theme: appTheme,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding: EdgeInsets.all(16.0), child: AmountSelector()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ExpensesSummary()),
            );
          },
          child: const Icon(Icons.summarize),
        ),
      ),
    );
  }
}
