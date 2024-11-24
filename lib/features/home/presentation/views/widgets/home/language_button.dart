import 'package:flutter/material.dart';

import '../../../../data/models/language_model.dart';
import '../../select_language_screen.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.language,
    required this.context,
    required this.callback,
  });

  final String language;
  final BuildContext context;
  final void Function(LanguageModel) callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectLanguageScreen(callback: callback),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blueAccent.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade700.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            language,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
