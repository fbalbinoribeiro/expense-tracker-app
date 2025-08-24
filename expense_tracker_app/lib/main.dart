import 'package:flutter/material.dart';

import 'features/category_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Selector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Select Category')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: CategorySelector(),
        ),
      ),
    );
  }
}
