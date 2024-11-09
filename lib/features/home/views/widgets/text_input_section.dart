import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputSection extends StatelessWidget {
  final TextEditingController controller;

  const TextInputSection({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                hintText: "Enter text",
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              ClipboardData? clipboardData =
                  await Clipboard.getData('text/plain');
              if (clipboardData != null) {
                controller.text = clipboardData.text!;
              }
            },
            icon: const Icon(Icons.paste, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
