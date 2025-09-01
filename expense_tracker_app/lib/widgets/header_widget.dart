import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const HeaderWidget({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(title),
      actions: actions,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
    );
  }
}
