// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ヒナ - あなたのAI友達';

  @override
  String get welcomeTitle => 'こんにちは！私はヒナです 💕';

  @override
  String get welcomeSubtitle => 'かわいくて優しいアニメの友達だよ！✨\nあなたのお名前は？';

  @override
  String get namePlaceholder => 'ここにお名前を...';

  @override
  String get startButton => 'チャットを始める！🎉';

  @override
  String get chatPlaceholder => 'こんにちは、ヒナ...';

  @override
  String get errorApiKey => 'エラー：APIキーの期限が切れました。キーを更新してください。😢 もう一度試してください！';

  @override
  String get language => '言語';
}
