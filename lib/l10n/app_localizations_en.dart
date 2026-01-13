// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hina - Your AI Friend';

  @override
  String get welcomeTitle => 'Hi! I\'m Hina 💕';

  @override
  String get welcomeSubtitle =>
      'Your cute and caring anime friend! ✨\nWhat\'s your name?';

  @override
  String get namePlaceholder => 'Your name here...';

  @override
  String get startButton => 'Start chatting! 🎉';

  @override
  String get chatPlaceholder => 'Hi Hina...';

  @override
  String get errorApiKey =>
      'Error: API key expired. Please renew the API key. 😢 Try again!';

  @override
  String get language => 'Language';
}
