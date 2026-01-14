// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Hina - Sua Amiga IA';

  @override
  String get welcomeTitle => 'Oi! Eu sou a Hina 💕';

  @override
  String get welcomeSubtitle =>
      'Sua amiga de anime fofa e atenciosa! ✨\nComo você se chama?';

  @override
  String get namePlaceholder => 'Seu nome aqui...';

  @override
  String get startButton => 'Começar a conversar! 😊';

  @override
  String get chatPlaceholder => 'Oi Hina...';

  @override
  String get errorApiKey =>
      'Erro: API key expirada. Remova a chave. 😢 Tenta de novo!';

  @override
  String get language => 'Idioma';
}
