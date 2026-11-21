/// Result returned by the backend's `POST /recognize` endpoint.
///
/// Draft contract, see ../../backend/README.md. Update both together when
/// the API is finalised.
class RecognitionResult {
  const RecognitionResult({
    required this.correctedText,
    this.rawText,
  });

  /// Text after the NLP correction step. Shown to the user for editing.
  final String correctedText;

  /// Recognizer output before correction (optional, for debugging and
  /// error analysis).
  final String? rawText;

  factory RecognitionResult.fromJson(Map<String, dynamic> json) {
    return RecognitionResult(
      correctedText: json['corrected_text'] as String? ?? '',
      rawText: json['raw_text'] as String?,
    );
  }
}
