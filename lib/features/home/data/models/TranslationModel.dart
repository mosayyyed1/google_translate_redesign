class TranslationModel {
  final int status;
  final String query;
  final String translateTo;
  final String translation;

  TranslationModel({
    required this.status,
    required this.query,
    required this.translateTo,
    required this.translation,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      status: json['status'],
      query: json['query'],
      translateTo: json['translateTo'],
      translation: json['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'query': query,
      'translateTo': translateTo,
      'translation': translation,
    };
  }
}
