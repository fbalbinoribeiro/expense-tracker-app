import 'package:expense_tracker_app/domain/enums/category.dart';

class ExpenseDTO {
  final Category category;
  final DateTime date;
  final double amount;

  ExpenseDTO({
    required this.category,
    required this.date,
    required this.amount,
  });

  factory ExpenseDTO.fromExpense(dynamic expense) {
    final categoryEnum = Category.values.firstWhere(
      (c) => c.name == expense.category,
      orElse: () => Category.other,
    );
    return ExpenseDTO(
      category: categoryEnum,
      date: expense.addedAt,
      amount: expense.amountInCents / 100.0,
    );
  }
}
