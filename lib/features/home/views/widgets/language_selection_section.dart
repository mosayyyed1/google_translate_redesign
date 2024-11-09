import 'package:flutter/material.dart';

class LanguageSelectionSection extends StatelessWidget {
  const LanguageSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLanguageButton("English", Colors.blue.shade700),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.compare_arrows, color: Colors.blue),
          ),
          const Spacer(),
          _buildLanguageButton("Arabic", Colors.blue.shade700),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(String language, Color color) {
    return Container(
      height: 50,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          language,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
