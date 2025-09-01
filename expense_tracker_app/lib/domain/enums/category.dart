import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum Category {
  food,
  transport,
  entertainment,
  home,
  company,
  health,
  personal,
  pet,
  other,
}

extension CategoryExtension on Category {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (this) {
      case Category.food:
        return l10n.categoryFood;
      case Category.transport:
        return l10n.categoryTransport;
      case Category.entertainment:
        return l10n.categoryEntertainment;
      case Category.home:
        return l10n.categoryHome;
      case Category.company:
        return l10n.categoryCompany;
      case Category.health:
        return l10n.categoryHealth;
      case Category.personal:
        return l10n.categoryPersonal;
      case Category.pet:
        return l10n.categoryPet;
      case Category.other:
        return l10n.categoryOther;
    }
  }

  IconData get icon {
    switch (this) {
      case Category.food:
        return Icons.restaurant;
      case Category.transport:
        return Icons.directions_car;
      case Category.entertainment:
        return Icons.movie;
      case Category.home:
        return Icons.home;
      case Category.company:
        return Icons.business;
      case Category.health:
        return Icons.local_hospital;
      case Category.personal:
        return Icons.person;
      case Category.other:
        return Icons.category;
      case Category.pet:
        return Icons.pets;
    }
  }

  Color get color {
    switch (this) {
      case Category.food:
        return Colors.orange;
      case Category.transport:
        return Colors.blue;
      case Category.entertainment:
        return Colors.purple;
      case Category.home:
        return Colors.green;
      case Category.company:
        return Colors.teal;
      case Category.health:
        return Colors.red;
      case Category.personal:
        return Colors.indigo;
      case Category.other:
        return Colors.grey;
      case Category.pet:
        return Colors.brown;
    }
  }
}
