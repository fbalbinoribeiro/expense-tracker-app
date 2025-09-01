import 'package:flutter/material.dart';

import '../domain/database/database.dart';
import '../domain/dto/expense_dto.dart';
import '../domain/enums/category.dart';
import '../infra/dao/expense_dao.dart';
import '../l10n/app_localizations.dart';
import '../widgets/header_widget.dart';

class ExpensesSummary extends StatefulWidget {
  const ExpensesSummary({super.key});

  @override
  State<ExpensesSummary> createState() => _ExpensesSummaryState();
}

class _ExpensesSummaryState extends State<ExpensesSummary> {
  List<ExpenseDTO> expenses = [];
  String? selectedCategory;
  late int selectedMonth;
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedMonth = now.month;
    selectedYear = now.year;
    _fetchExpenses();
  }

  Future<void> _fetchExpenses() async {
    final db = AppDatabase();
    final dao = ExpenseDao(db);
    String? categoryName;
    final allLabel = AppLocalizations.of(context).allCategories;
    if (selectedCategory != null && selectedCategory != allLabel) {
      final catEnum = Category.values.firstWhere(
        (c) => c.localizedName(context) == selectedCategory,
        orElse: () => Category.other,
      );
      categoryName = catEnum.name;
    }
    final result = await dao.getExpensesForMonthYearCategory(
      selectedMonth,
      selectedYear,
      category: categoryName,
    );
    setState(() {
      expenses = result.map((e) => ExpenseDTO.fromExpense(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allLabel = AppLocalizations.of(context).allCategories;
    final categories = [
      allLabel,
      ...Category.values.map((c) => c.localizedName(context)),
    ];
    final now = DateTime.now();
    final startYear = now.year - 5;
    final endYear = now.year + 5;
    final months = List.generate(12, (i) => i + 1);
    final years = List.generate(endYear - startYear + 1, (i) => startYear + i);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderWidget(
          title: AppLocalizations.of(context).expensesSummary,
          showBackButton: true,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<int>(
                  value: selectedMonth,
                  items: months.map((m) {
                    return DropdownMenuItem(
                      value: m,
                      child: Text(m.toString().padLeft(2, '0')),
                    );
                  }).toList(),
                  onChanged: (v) async {
                    if (v != null) {
                      setState(() => selectedMonth = v);
                      await _fetchExpenses();
                    }
                  },
                ),
                const SizedBox(width: 16),
                DropdownButton<int>(
                  value: selectedYear,
                  items: years.map((y) {
                    return DropdownMenuItem(
                      value: y,
                      child: Text(y.toString()),
                    );
                  }).toList(),
                  onChanged: (v) async {
                    if (v != null) {
                      setState(() => selectedYear = v);
                      await _fetchExpenses();
                    }
                  },
                ),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedCategory ?? allLabel,
                  items: categories.map((cat) {
                    return DropdownMenuItem(value: cat, child: Text(cat));
                  }).toList(),
                  onChanged: (v) async {
                    setState(() => selectedCategory = v);
                    await _fetchExpenses();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  leading: Icon(
                    expense.category.icon,
                    color: expense.category.color,
                  ),
                  title: Text(expense.category.localizedName(context)),
                  subtitle: Text(
                    '${expense.date.day.toString().padLeft(2, '0')}/${expense.date.month.toString().padLeft(2, '0')}/${expense.date.year}',
                  ),
                  trailing: Text('R\$ ${expense.amount.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
