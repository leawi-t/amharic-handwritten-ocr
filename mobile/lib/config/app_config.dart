/// App-wide configuration.
///
/// Keep configuration separate from code (guideline 8.5). Override the backend
/// URL at build time instead of editing this file:
///   flutter run --dart-define=BACKEND_URL=http://192.168.1.10:8000
class AppConfig {
  const AppConfig._();

  /// Base URL of the FastAPI recognition backend (see ../backend/README.md).
  /// 10.0.2.2 is the host machine as seen from the Android emulator.
  static const String backendUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  /// Request timeout for recognition calls.
  static const Duration requestTimeout = Duration(seconds: 30);
}
