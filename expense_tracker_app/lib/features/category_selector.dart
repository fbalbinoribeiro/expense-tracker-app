import 'package:flutter/material.dart';

import '../domain/enums/category.dart';
import '../domain/models/database.dart';
import '../widgets/header_widget.dart';

class CategorySelector extends StatelessWidget {
  final void Function(Category)? onCategorySelected;

  final double amount;

  const CategorySelector({
    super.key,
    this.onCategorySelected,
    required this.amount,
  });

  Future<void> _saveExpense(
    BuildContext context,
    double amount,
    Category category,
  ) async {
    final db = AppDatabase();
    await db
        .into(db.expenses)
        .insert(
          ExpensesCompanion.insert(
            amountInCents: (amount * 100).toInt(),
            category: category.name,
            addedAt: DateTime.now(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final categories = Category.values;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: HeaderWidget(
              title: 'Amount: R\$ ${amount.toStringAsFixed(2)}',
              showBackButton: true,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await _saveExpense(context, amount, category);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successfully added!'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                      onCategorySelected?.call(category);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category.color,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: category.color, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category.icon, color: Colors.white, size: 24),
                          const SizedBox(height: 8),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              category.name[0].toUpperCase() +
                                  category.name.substring(1),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
