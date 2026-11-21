import 'package:flutter_test/flutter_test.dart';

import 'package:amharic_ocr/main.dart';

void main() {
  testWidgets('capture → review flow shows editable recognized text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AmharicOcrApp());

    expect(find.text('Capture handwriting'), findsOneWidget);

    await tester.tap(find.text('Take a photo'));
    // Let the fake service's 300 ms delay finish, then the route transition.
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    expect(find.text('Review and edit'), findsOneWidget);
    expect(find.text('ይህ የሙከራ ጽሑፍ ነው'), findsOneWidget);
  });
}
