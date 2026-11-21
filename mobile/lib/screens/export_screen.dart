import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Save / export screen.
///
/// Copy to clipboard works now. Saving to a file (package:path_provider) and
/// sharing (package:share_plus) are still to be added.
class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save or export')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: SingleChildScrollView(child: SelectableText(text))),
            const SizedBox(height: 16),
            FilledButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copy text'),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: text));
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
            ),
            const SizedBox(height: 8),
            const OutlinedButton(
              onPressed: null, // TODO: save as .txt / .docx and share
              child: Text('Save as document (coming soon)'),
            ),
          ],
        ),
      ),
    );
  }
}
