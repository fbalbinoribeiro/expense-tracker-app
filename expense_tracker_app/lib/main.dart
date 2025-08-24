import 'package:expense_tracker_app/features/amount_selector.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() {
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
        appBar: AppBar(title: const Text('Select Category')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: AmountSelector(),
        ),
      ),
    );
  }
}
