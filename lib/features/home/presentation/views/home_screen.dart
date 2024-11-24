import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/translate_cubit.dart';
import 'widgets/home/app_bar_section.dart';
import 'widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return const Scaffold(
          appBar: AppBarSection(),
          body: HomeBody(),
        );
      },
    );
  }
}
