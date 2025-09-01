import 'package:drift/drift.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amountInCents => integer()();
  TextColumn get category => text()();
  DateTimeColumn get addedAt => dateTime()();

  List<Set<Column>> get indexes => [
    {addedAt},
    {category, addedAt},
  ];
}
