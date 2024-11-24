import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translate_redesign/features/home/presentation/controller/translate_cubit.dart';

import '../../../../data/models/language_model.dart';
import 'language_button.dart';

class LanguageSelectionSection extends StatelessWidget {
  const LanguageSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final translateCubit = BlocProvider.of<TranslateCubit>(context);

    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageButton(
                language: translateCubit.fromLanguage.name,
                context: context,
                callback: (LanguageModel selectedLanguage) {
                  translateCubit.updateFromLanguage(selectedLanguage);
                },
              ),
              const Spacer(),
              IconButton(
                onPressed: translateCubit.swapLanguages,
                icon: Icon(
                  Icons.compare_arrows,
                  color: Colors.blueAccent.withOpacity(0.9),
                ),
              ),
              const Spacer(),
              LanguageButton(
                language: translateCubit.toLanguage.name,
                context: context,
                callback: (LanguageModel selectedLanguage) {
                  translateCubit.updateToLanguage(selectedLanguage);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
