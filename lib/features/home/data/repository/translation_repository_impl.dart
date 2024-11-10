import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_translate_redesign/core/utils/api_service.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../models/TranslationModel.dart';
import 'translation_repository.dart';

class TranslationRepositoryImpl implements TranslationRepository {
  final ApiService apiService;

  TranslationRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, TranslationModel>> translate(
      String from, String to, String query) async {
    try {
      final response = await apiService.post(
        endpoint: "free-google-translator",
        queryParameters: {
          'from': from,
          'to': to,
          'query': query,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Host': 'free-google-translator.p.rapidapi.com',
            'X-RapidAPI-Key':
                'ffc411ee28mshcb2817f49776dd6p1b9669jsn86d4af63b801',
          },
        ),
        data: {
          'translate': 'rapidapi',
        },
      );

      if (response.data != null) {
        print("----------------------------$response");

        if (response.statusCode == 200) {
          final translationModel = TranslationModel.fromJson(response.data);
          return Right(translationModel);
        } else {
          final errorMessage =
              response.data['message'] ?? 'Failed to load translation data';
          return Left(ServerFailure(errorMessage));
        }
      } else {
        return Left(ServerFailure('No data received'));
      }
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioException(error));
    }
  }
}
