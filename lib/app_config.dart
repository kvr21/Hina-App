class AppConfig {
  static const googleApiKey =
      String.fromEnvironment('GOOGLE_API_KEY', defaultValue: '');
}
