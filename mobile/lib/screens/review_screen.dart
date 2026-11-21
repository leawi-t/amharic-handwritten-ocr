import 'package:flutter/material.dart';

import '../models/recognition_result.dart';
import 'export_screen.dart';

/// Review and edit screen: shows the corrected text in an editable field.
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.result});

  final RecognitionResult result;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.result.correctedText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review and edit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                key: const Key('editField'),
                controller: _controller,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Recognized text',
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('continueButton'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ExportScreen(text: _controller.text),
                ),
              ),
              child: const Text('Continue to export'),
            ),
          ],
        ),
      ),
    );
  }
}
