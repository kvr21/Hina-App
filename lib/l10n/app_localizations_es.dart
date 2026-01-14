// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Hina - Tu Amiga IA';

  @override
  String get welcomeTitle => '¡Hola! Soy Hina 💕';

  @override
  String get welcomeSubtitle =>
      '¡Tu linda y cariñosa amiga anime! ✨\n¿Cómo te llamas?';

  @override
  String get namePlaceholder => 'Tu nombre aquí...';

  @override
  String get startButton => '¡Empezar a chatear! 😊';

  @override
  String get chatPlaceholder => 'Hola Hina...';

  @override
  String get errorApiKey =>
      'Error: La clave API expiró. Renueva la clave. 😢 ¡Intenta de nuevo!';

  @override
  String get language => 'Idioma';
}
