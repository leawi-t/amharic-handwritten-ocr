import '../models/recognition_result.dart';

/// Sends an image to the backend and returns the recognized, corrected text.
///
/// The interface lets screens and tests use a fake implementation until the
/// backend endpoint exists.
abstract class RecognitionService {
  Future<RecognitionResult> recognize(String imagePath);
}

/// Placeholder used until the backend `/recognize` endpoint is implemented.
///
/// Replace with an HTTP implementation (package:http, multipart upload to
/// `${AppConfig.backendUrl}/recognize`) once the API contract is final.
class FakeRecognitionService implements RecognitionService {
  const FakeRecognitionService();

  @override
  Future<RecognitionResult> recognize(String imagePath) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const RecognitionResult(
      correctedText: 'ይህ የሙከራ ጽሑፍ ነው',
      rawText: 'ይህ የሙከራ ጽሁፍ ነዉ',
    );
  }
}
