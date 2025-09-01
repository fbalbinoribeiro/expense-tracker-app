import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/header_widget.dart';

class ExpensesSummary extends StatelessWidget {
  const ExpensesSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement summary UI
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderWidget(
          title: AppLocalizations.of(context).expensesSummary,
          showBackButton: true,
        ),
      ),
      body: Center(child: Text(AppLocalizations.of(context).noExpenses)),
    );
  }
}
