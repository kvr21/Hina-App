import 'package:google_generative_ai/google_generative_ai.dart';
import 'app_config.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService()
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash-latest',
          apiKey: AppConfig.googleApiKey,
        );

  Future<String> send(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text ?? '';
  }
}
