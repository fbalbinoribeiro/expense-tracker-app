import 'app_localizations_strategy.dart';

class AppLocalizationsPtBr implements AppLocalizationsStrategy {
  @override
  String get deleteConfirmTitle => 'Excluir Despesa';
  @override
  String get deleteConfirmMessage =>
      'Tem certeza que deseja excluir esta despesa?';
  @override
  String get delete => 'Excluir';
  @override
  String get cancel => 'Cancelar';
  @override
  String get successfullyAdded => 'Adicionado com sucesso!';
  @override
  String get totalExpenses => 'Total de Despesas';
  @override
  String get totalAmount => 'Valor Total';
  @override
  String get allCategories => 'Todos';
  @override
  String get clear => 'Limpar';
  @override
  String get appTitle => 'Selecionador de Valor';
  @override
  String get noExpenses => 'Nenhuma despesa ainda.';
  @override
  String get expensesSummary => 'Resumo de Despesas';
  @override
  String get amount => 'Valor';
  @override
  String get categoryFood => 'Alimentação';
  @override
  String get categoryTransport => 'Transporte';
  @override
  String get categoryEntertainment => 'Entretenimento';
  @override
  String get categoryHome => 'Casa';
  @override
  String get categoryCompany => 'Empresa';
  @override
  String get categoryHealth => 'Saúde';
  @override
  String get categoryPersonal => 'Pessoal';
  @override
  String get categoryPet => 'Pet';
  @override
  String get categoryOther => 'Outro';
}
