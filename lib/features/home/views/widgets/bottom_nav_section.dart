import 'package:flutter/material.dart';

class BottomNavSection extends StatelessWidget {
  const BottomNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomIcon(Icons.chat, "Conversation"),
          _buildBottomIcon(Icons.mic, "Voice"),
          _buildBottomIcon(Icons.camera_alt, "Camera"),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade700,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
              color: Colors.grey.shade800, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
