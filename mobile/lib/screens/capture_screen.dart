import 'package:flutter/material.dart';

import '../services/recognition_service.dart';
import 'review_screen.dart';

/// Capture / upload screen (FR-01, FR-02).
///
/// Camera and gallery access will use package:image_picker. For now both
/// buttons run the fake recognition service so the navigation flow can be
/// built and tested.
class CaptureScreen extends StatelessWidget {
  const CaptureScreen({
    super.key,
    this.service = const FakeRecognitionService(),
  });

  final RecognitionService service;

  Future<void> _recognize(BuildContext context, String imagePath) async {
    final result = await service.recognize(imagePath);
    if (!context.mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ReviewScreen(result: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture handwriting')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.icon(
                key: const Key('captureButton'),
                icon: const Icon(Icons.photo_camera),
                label: const Text('Take a photo'),
                onPressed: () => _recognize(context, 'camera-placeholder'),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                key: const Key('uploadButton'),
                icon: const Icon(Icons.photo_library),
                label: const Text('Upload from gallery'),
                onPressed: () => _recognize(context, 'gallery-placeholder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
