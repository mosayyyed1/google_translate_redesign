import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/api_service.dart';
import 'features/home/data/repository/translation_repository_impl.dart';
import 'features/home/presentation/controller/translate_cubit.dart';
import 'features/splash/views/screens/splash_screen.dart';

void main() {
  runApp(const GoogleTranslateRedesignApp());
}

class GoogleTranslateRedesignApp extends StatelessWidget {
  const GoogleTranslateRedesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TranslateCubit(TranslationRepositoryImpl(ApiService(Dio()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
