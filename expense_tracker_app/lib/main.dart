import 'package:expense_tracker_app/features/amount_selector.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() {
  // debugPaintSizeEnabled = true; // Outlines boxes
  // debugPaintBaselinesEnabled = true; // Shows text baselines
  // debugPaintPointersEnabled = true; // Highlights touch areas
  // debugPaintLayerBordersEnabled = true; // Outlines composited layers
  // debugRepaintRainbowEnabled = true; // Flashes repaint regions

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
