# Mobile App (`mobile/`)

Owner: Leawi Tadesse

Flutter application, as in the approved proposal: image capture or upload,
sends the image to the backend (`../backend/`), shows the corrected text in an
editable interface, and saves or exports the final document.

## Folder layout

```
mobile/
├── lib/
│   ├── main.dart                     App entry point
│   ├── config/app_config.dart        Backend URL and timeouts (set with --dart-define)
│   ├── models/recognition_result.dart  Response from POST /recognize
│   ├── services/recognition_service.dart  Backend client (fake implementation for now)
│   ├── screens/
│   │   ├── capture_screen.dart       Camera / gallery (FR-01, FR-02)
│   │   ├── review_screen.dart        Editable recognized text
│   │   └── export_screen.dart        Copy, save, share
│   └── widgets/                      Reusable UI components
├── test/widget_test.dart             Capture → review flow test
├── assets/fonts/                     Ethiopic font (Noto Sans Ethiopic) goes here
├── pubspec.yaml
└── analysis_options.yaml
```

The `android/` and `ios/` platform folders are not in the repo yet. Generate
them once (step 2 below) and commit them.

## First-time setup

Requires the [Flutter SDK](https://docs.flutter.dev/get-started/install)
(Dart 3.4 or later). Check with `flutter doctor`.

```bash
cd mobile

# 1. Get dependencies
flutter pub get

# 2. Generate the platform folders. Existing files in lib/ and test/ are kept.
flutter create --org et.edu.aau --project-name amharic_ocr --platforms=android,ios .

# 3. Add the planned packages (gets current compatible versions)
flutter pub add image_picker http path_provider share_plus

# 4. Run the tests and the app
flutter test
flutter run --dart-define=BACKEND_URL=http://10.0.2.2:8000
```

After step 3, camera and gallery access need platform permissions:
`NSCameraUsageDescription` and `NSPhotoLibraryUsageDescription` in
`ios/Runner/Info.plist`. See the image_picker package page for Android notes.

## Planned screens

- **Capture/Upload**: camera capture or image upload
- **Review & Edit**: shows recognized and corrected text, editable
- **Export**: save or export the final document

## Status

Skeleton only. Navigation works end to end with a fake recognition service.
Camera, gallery, backend calls and file export are not implemented yet.
