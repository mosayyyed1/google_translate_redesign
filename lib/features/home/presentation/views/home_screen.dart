import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/translate_cubit.dart';
import 'widgets/home/app_bar_section.dart';
import 'widgets/home/bottom_nav_section.dart';
import 'widgets/home/language_selection_section.dart';
import 'widgets/home/text_input_section.dart';
import 'widgets/home/translation_result_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: const AppBarSection(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const LanguageSelectionSection(),
                    const SizedBox(height: 20),
                    TextInputSection(controller: _textController),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TranslateCubit>(context).translate(
                          BlocProvider.of<TranslateCubit>(context)
                              .fromLanguage
                              .code,
                          BlocProvider.of<TranslateCubit>(context)
                              .toLanguage
                              .code,
                          _textController.text,
                        );
                      },
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
                    if (state is TranslateSuccess)
                      TranslationResultSection(
                          translationResult:
                              state.translationModel.translation),
                    if (state is TranslateFailure)
                      Text(state.message,
                          style: const TextStyle(color: Colors.red)),
                    const BottomNavSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
