import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../domain/enums/category.dart';
import '../domain/models/expense.dart';

class CategorySelector extends StatelessWidget {
  final void Function(Category)? onCategorySelected;

  final double amount;

  const CategorySelector({
    super.key,
    this.onCategorySelected,
    required this.amount,
  });

  Future<void> _saveExpense(double amount, Category category) async {
    final isar = Isar.getInstance();
    if (isar == null) return;
    final expense = Expense(
      amountInCents: (amount * 100).toInt(),
      category: category,
      addedAt: DateTime.now(),
    );
    await isar.writeTxn(() async {
      await isar.collection<Expense>().put(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = Category.values;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Amount: R\$ ${amount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await _saveExpense(amount, category);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Successfully added!'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.of(context).pop();
                          onCategorySelected?.call(category);
                        });
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
                            Icon(category.icon, color: Colors.white, size: 40),
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
      ),
    );
  }
}
