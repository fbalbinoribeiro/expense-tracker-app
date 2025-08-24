import 'package:flutter/material.dart';

import '../domain/enums/category.dart';

class CategorySelector extends StatelessWidget {
  final void Function(Category)? onCategorySelected;

  const CategorySelector({super.key, this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final categories = Category.values;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => onCategorySelected?.call(category),
            child: Container(
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: category.color, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category.icon, color: category.color, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    category.name[0].toUpperCase() + category.name.substring(1),
                    style: TextStyle(
                      color: category.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
