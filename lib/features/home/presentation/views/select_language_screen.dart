import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_translate_redesign/features/home/presentation/controller/translate_cubit.dart';

import '../../data/models/language_model.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({
    super.key,
    required this.callback,
  });

  final void Function() callback;

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
            // Search bar section
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Languages...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
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
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemCount: _filteredLanguages.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            horizontalOffset: 60.0,
                            child: FadeInAnimation(
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  title: Text(
                                    _filteredLanguages[index].name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    _filteredLanguages[index].code,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    widget.callback(); // Corrected line
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
