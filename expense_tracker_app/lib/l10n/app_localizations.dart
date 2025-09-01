import 'package:flutter/material.dart';

import 'app_localizations_en.dart';
import 'app_localizations_ptbr.dart';
import 'app_localizations_strategy.dart';

class AppLocalizations {
  final AppLocalizationsStrategy _strategy;

  AppLocalizations._(this._strategy);

  static AppLocalizations of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'pt' && locale.countryCode == 'BR') {
      return AppLocalizations._(AppLocalizationsPtBr());
    } else {
      return AppLocalizations._(AppLocalizationsEn());
    }
  }

  String get appTitle => _strategy.appTitle;
  String get noExpenses => _strategy.noExpenses;
  String get expensesSummary => _strategy.expensesSummary;
  String get amount => _strategy.amount;
  String get categoryFood => _strategy.categoryFood;
  String get categoryTransport => _strategy.categoryTransport;
  String get categoryEntertainment => _strategy.categoryEntertainment;
  String get categoryHome => _strategy.categoryHome;
  String get categoryCompany => _strategy.categoryCompany;
  String get categoryHealth => _strategy.categoryHealth;
  String get categoryPersonal => _strategy.categoryPersonal;
  String get categoryPet => _strategy.categoryPet;
  String get categoryOther => _strategy.categoryOther;
  String get clear => _strategy.clear;
  String get allCategories => _strategy.allCategories;
  String get totalExpenses => _strategy.totalExpenses;
  String get totalAmount => _strategy.totalAmount;
}
