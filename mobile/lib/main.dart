import 'package:flutter/material.dart';

import 'screens/capture_screen.dart';

void main() {
  runApp(const AmharicOcrApp());
}

class AmharicOcrApp extends StatelessWidget {
  const AmharicOcrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amharic Handwriting OCR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        // fontFamily: 'NotoSansEthiopic', // enable once the font is added (pubspec.yaml)
      ),
      home: const CaptureScreen(),
    );
  }
}
