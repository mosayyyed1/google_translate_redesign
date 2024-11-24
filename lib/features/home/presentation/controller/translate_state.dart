part of 'translate_cubit.dart';

class TranslateState {}

final class TranslateInitial extends TranslateState {}

final class TranslateLoading extends TranslateState {}

final class TranslateSuccess extends TranslateState {
  final TranslationModel translationModel;

  TranslateSuccess(this.translationModel);
}

final class TranslateFailure extends TranslateState {
  final String message;

  TranslateFailure(this.message);
}

class TranslateLanguageUpdated extends TranslateState {}
