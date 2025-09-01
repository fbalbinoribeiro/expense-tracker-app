import 'package:drift/drift.dart';
import 'package:expense_tracker_app/domain/models/expense.dart';
import 'package:expense_tracker_app/domain/database/database.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<List<Expense>> getExpensesForMonthYearCategory(
    int month,
    int year, {
    String? category,
  }) async {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final query = select(expenses)
      ..where((tbl) => tbl.addedAt.isBetweenValues(start, end));
    if (category != null && category.isNotEmpty) {
      query.where((tbl) => tbl.category.equals(category));
    }
    return query.get();
  }

  Future<int> insertExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  Future<int> deleteExpense(int id) =>
      (delete(expenses)..where((tbl) => tbl.id.equals(id))).go();
}
