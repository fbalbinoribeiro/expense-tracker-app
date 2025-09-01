import 'package:drift/drift.dart';
import 'package:expense_tracker_app/domain/database/database.dart';
import 'package:expense_tracker_app/domain/models/expense.dart';

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
    final nextMonth = month == 12
        ? DateTime(year + 1, 1, 1)
        : DateTime(year, month + 1, 1);
    final query = select(expenses)
      ..where(
        (tbl) =>
            tbl.addedAt.isBiggerOrEqualValue(start) &
            tbl.addedAt.isSmallerThanValue(nextMonth),
      )
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.addedAt, mode: OrderingMode.desc),
      ]);
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
