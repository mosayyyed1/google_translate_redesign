import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translate_redesign/features/home/presentation/controller/translate_cubit.dart';

import '../../select_language_screen.dart';

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
              _buildLanguageButton(translateCubit.fromLanguage.name, context),
              const Spacer(),
              IconButton(
                onPressed: () {
                  translateCubit.swapLanguages();
                },
                icon: const Icon(Icons.compare_arrows, color: Colors.blue),
              ),
              const Spacer(),
              _buildLanguageButton(translateCubit.toLanguage.name, context),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildLanguageButton(String language, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SelectLanguageScreen(),
        ),
      );
    },
    child: Container(
      height: 50,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue.shade700,
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
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
