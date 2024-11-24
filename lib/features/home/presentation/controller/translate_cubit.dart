import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translate_redesign/core/error/failure.dart';
import 'package:google_translate_redesign/features/home/data/models/language_model.dart';

import '../../data/models/TranslationModel.dart';
import '../../data/repository/translation_repository.dart';

part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  final TranslationRepository translationRepository;
  final TextEditingController textController = TextEditingController();
  LanguageModel fromLanguage = LanguageModel(code: "ar", name: "Arabic");
  LanguageModel toLanguage = LanguageModel(code: "en", name: "English");

  TranslateCubit(this.translationRepository) : super(TranslateInitial());

  Future<void> translate(String from, String to, String query) async {
    emit(TranslateLoading());

    final Either<Failure, TranslationModel> result =
        await translationRepository.translate(from, to, query);

    result.fold(
      (failure) => emit(TranslateFailure(failure.message)),
      (translationModel) => emit(TranslateSuccess(translationModel)),
    );
  }

  Future<List<LanguageModel>> loadLanguages() async {
    return await translationRepository.loadLanguages();
  }

  void setFromLanguage(LanguageModel language) {
    fromLanguage = language;
    emit(TranslateLanguageUpdated());
  }

  void setToLanguage(LanguageModel language) {
    toLanguage = language;
    emit(TranslateLanguageUpdated());
  }

  void swapLanguages() {
    final temp = fromLanguage;
    fromLanguage = toLanguage;
    toLanguage = temp;
    emit(TranslateLanguageUpdated());
  }
}
