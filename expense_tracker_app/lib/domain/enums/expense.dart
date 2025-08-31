import 'package:isar/isar.dart';

import 'category.dart';

part 'expense.g.dart';

@collection
class Expense {
  Id id = Isar.autoIncrement;

  final int amountInCents;

  @enumerated
  @Index(type: IndexType.value)
  final Category category;

  final DateTime addedAt;

  Expense({
    required this.amountInCents,
    required this.category,
    required this.addedAt,
  });
}
