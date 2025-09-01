import 'package:flutter/material.dart';

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
