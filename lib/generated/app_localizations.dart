import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('es'),
    Locale('ja')
  ];

  String get appTitle;
  String get welcomeTitle;
  String get welcomeSubtitle;
  String get namePlaceholder;
  String get startButton;
  String get chatPlaceholder;
  String get errorApiKey;
  String get language;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'ja', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'ja': return AppLocalizationsJa();
    case 'pt': return AppLocalizationsPt();
  }
  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale"');
}

// English
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn() : super('en');

  @override String get appTitle => 'Hina - Your anime AI friend';
  @override String get welcomeTitle => 'Hi! I am Hina 💕';
  @override String get welcomeSubtitle => 'Your anime friend is super cute and attentive! ✨ How do you call yourself?';
  @override String get namePlaceholder => 'Your name here...';
  @override String get startButton => 'Start chatting! 😊';
  @override String get chatPlaceholder => 'Hi Hina...';
  @override String get errorApiKey => 'Error: Expired API key. Remove the key. 😔 Try again!';
  @override String get language => 'Language';
}

// Portuguese
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt() : super('pt');

  @override String get appTitle => 'Hina - Sua amiga IA fofa!';
  @override String get welcomeTitle => 'Oi! Eu sou a Hina 💕';
  @override String get welcomeSubtitle => 'Sua amiga de anime fofa e atenciosa! ✨ \nComo você se chama?';
  @override String get namePlaceholder => 'Seu nome aqui...';
  @override String get startButton => 'Começar a conversar! 😊';
  @override String get chatPlaceholder => 'Oi Hina...';
  @override String get errorApiKey => 'Erro: API key expirada. Remova a chave. 😔 Tenta de novo!';
  @override String get language => 'Idioma';
}

// Spanish
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs() : super('es');

  @override String get appTitle => 'Hina - ¡Tu amiga IA linda!';
  @override String get welcomeTitle => '¡Hola! Soy Hina 💕';
  @override String get welcomeSubtitle => '¡Tu amiga de anime linda y atenta! ✨ \n¿Cómo te llamas?';
  @override String get namePlaceholder => 'Tu nombre aquí...';
  @override String get startButton => '¡Empezar a chatear! 😊';
  @override String get chatPlaceholder => 'Hola Hina...';
  @override String get errorApiKey => 'Error: Clave API caducada. Elimina la clave. 😔 ¡Intenta de nuevo!';
  @override String get language => 'Idioma';
}

// Japanese
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa() : super('ja');

  @override String get appTitle => 'ヒナ - あなたのかわいいAI友達';
  @override String get welcomeTitle => 'こんにちは！私はヒナです💕';
  @override String get welcomeSubtitle => 'あなたのかわいくて優しいアニメの友達！✨\nお名前は？';
  @override String get namePlaceholder => 'ここにあなたの名前...';
  @override String get startButton => 'チャットを始めましょう！😊';
  @override String get chatPlaceholder => 'ヒナちゃん...';
  @override String get errorApiKey => 'エラー：APIキーが期限切れです。キーを削除してください。😔 もう一度お試しください！';
  @override String get language => '言語';
}
