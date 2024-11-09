import 'package:flutter/material.dart';

import 'widgets/app_bar_section.dart';
import 'widgets/bottom_nav_section.dart';
import 'widgets/language_selection_section.dart';
import 'widgets/text_input_section.dart';
import 'widgets/translation_result_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const AppBarSection(),
      body: SafeArea(
        child: Column(
          children: [
            const LanguageSelectionSection(),
            const SizedBox(height: 20),
            TextInputSection(controller: _textController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                "Translate",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            const TranslationResultSection(),
            const Spacer(),
            const BottomNavSection(),
          ],
        ),
      ),
    );
  }
}
