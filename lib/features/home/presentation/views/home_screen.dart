import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/translate_cubit.dart';
import 'widgets/home/app_bar_section.dart';
import 'widgets/home/bottom_nav_section.dart';
import 'widgets/home/language_selection_section.dart';
import 'widgets/home/text_input_section.dart';
import 'widgets/home/translation_result_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        final cubit = context.read<TranslateCubit>();

        return Scaffold(
          appBar: const AppBarSection(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LanguageSelectionSection(),
                    // const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter text to translate:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextInputSection(),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TranslateCubit>(context).translate(
                          cubit.fromLanguage.code,
                          cubit.toLanguage.code,
                          cubit.textController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent.withOpacity(0.9),
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (state is TranslateSuccess)
                      TranslationResultSection(
                        translationResult: state.translationModel.translation,
                      ),
                    if (state is TranslateFailure)
                      Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 40),
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
