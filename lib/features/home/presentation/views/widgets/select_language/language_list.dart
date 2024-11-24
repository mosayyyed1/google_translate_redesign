import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../data/models/language_model.dart';

class LanguageList extends StatelessWidget {
  final List<LanguageModel> languages;
  final void Function(LanguageModel) onLanguageTap;

  const LanguageList({
    super.key,
    required this.languages,
    required this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              horizontalOffset: 60.0,
              child: FadeInAnimation(
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    title: Text(
                      languages[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      languages[index].code,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.blue),
                    onTap: () => onLanguageTap(languages[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
