import 'package:dartz/dartz.dart';
import 'package:google_translate_redesign/features/home/data/models/TranslationModel.dart';

import '../../../../core/error/failure.dart';
import '../models/language_model.dart';

abstract class TranslationRepository {
  Future<Either<Failure, TranslationModel>> translate(
      String from, String to, String query);

  Future<List<LanguageModel>> loadLanguages();
}
