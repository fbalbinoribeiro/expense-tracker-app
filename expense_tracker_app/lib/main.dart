import 'package:expense_tracker_app/features/amount_selector.dart';
import 'package:expense_tracker_app/features/expenses_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: 'Expenses Tracker',
      theme: appTheme,
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AmountSelector(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ExpensesSummary()),
          );
        },
        child: const Icon(Icons.summarize),
      ),
    );
  }
}
