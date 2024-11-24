import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/language_model.dart';
import '../../presentation/controller/translate_cubit.dart';
import 'widgets/select_language/language_list.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({
    super.key,
    required this.callback,
  });

  final void Function(LanguageModel) callback;
  @override
  SelectLanguageScreenState createState() => SelectLanguageScreenState();
}

class SelectLanguageScreenState extends State<SelectLanguageScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<LanguageModel> _languages = [];
  List<LanguageModel> _filteredLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent.withOpacity(0.9),
        title: const Text(
          "Select Language",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              onChanged: _filterLanguages,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<LanguageModel>>(
                future:
                    BlocProvider.of<TranslateCubit>(context).loadLanguages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.language,
                              size: 60,
                              color: Colors.blueAccent.withOpacity(0.7)),
                          const SizedBox(height: 16),
                          const Text(
                            "No languages available",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }
                  if (_languages.isEmpty) {
                    _languages = snapshot.data!;
                    _filteredLanguages = _languages;
                  }
                  return LanguageList(
                    languages: _filteredLanguages,
                    onLanguageTap: (language) {
                      widget.callback(language);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterLanguages(String query) {
    setState(() {
      _filteredLanguages = _languages
          .where((language) =>
              language.name.toLowerCase().contains(query.toLowerCase()) ||
              language.code.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
