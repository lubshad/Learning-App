import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class MenuListItems extends StatelessWidget {
  const MenuListItems({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = blackColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
