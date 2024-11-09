import 'package:flutter/material.dart';

import 'core/themes/app_colors.dart';
import 'features/splash/views/screens/splash_screen.dart';

void main() {
  runApp(const GoogleTranslateRedesignApp());
}

class GoogleTranslateRedesignApp extends StatelessWidget {
  const GoogleTranslateRedesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
