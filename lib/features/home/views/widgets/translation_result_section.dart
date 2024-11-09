import 'package:flutter/material.dart';

class TranslationResultSection extends StatelessWidget {
  const TranslationResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Translation result will appear here.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.copy, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
