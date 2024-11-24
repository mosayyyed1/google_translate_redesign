import 'package:flutter/material.dart';

class SelectLanguageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SelectLanguageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.blueAccent.withOpacity(0.9),
      title: const Text(
        "Select Language",
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
