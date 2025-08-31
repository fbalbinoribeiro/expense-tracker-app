import 'package:expense_tracker_app/domain/models/expense.dart';
import 'package:expense_tracker_app/features/amount_selector.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app_theme.dart';

void main() async {
  // debugPaintSizeEnabled = true; // Outlines boxes
  // debugPaintBaselinesEnabled = true; // Shows text baselines
  // debugPaintPointersEnabled = true; // Highlights touch areas
  // debugPaintLayerBordersEnabled = true; // Outlines composited layers
  // debugRepaintRainbowEnabled = true; // Flashes repaint regions

  final dir = await getApplicationDocumentsDirectory();
  Isar.openSync([ExpenseSchema], directory: dir.path.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Selector',
      theme: appTheme,
      home: Scaffold(
        body: Padding(padding: EdgeInsets.all(16.0), child: AmountSelector()),
      ),
    );
  }
}
