import 'app_localizations_strategy.dart';

class AppLocalizationsEn implements AppLocalizationsStrategy {
  @override
  String get deleteConfirmTitle => 'Delete Expense';
  @override
  String get deleteConfirmMessage =>
      'Are you sure you want to delete this expense?';
  @override
  String get delete => 'Delete';
  @override
  String get cancel => 'Cancel';
  @override
  String get successfullyAdded => 'Successfully added!';
  @override
  String get totalExpenses => 'Total Expenses';
  @override
  String get totalAmount => 'Total Amount';
  @override
  String get allCategories => 'All';
  @override
  String get clear => 'Clear';
  @override
  String get appTitle => 'Amount Selector';
  @override
  String get noExpenses => 'No expenses yet.';
  @override
  String get expensesSummary => 'Expenses Summary';
  @override
  String get amount => 'Amount';
  @override
  String get categoryFood => 'Food';
  @override
  String get categoryTransport => 'Transport';
  @override
  String get categoryEntertainment => 'Entertainment';
  @override
  String get categoryHome => 'Home';
  @override
  String get categoryCompany => 'Company';
  @override
  String get categoryHealth => 'Health';
  @override
  String get categoryPersonal => 'Personal';
  @override
  String get categoryPet => 'Pet';
  @override
  String get categoryOther => 'Other';
}
