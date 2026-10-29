# Task 10: Firebase Realtime Database read and write

**B4 date in the teaching plan:** 08/10/2026  
**Dart entry file:** `main.dart`

## Run
1. Create/open a Flutter project.
2. Copy this `main.dart` into `lib/main.dart`.
3. Run `flutter pub get`, then `flutter run`.

## Firebase setup required for Task 10
Add these dependencies (use current compatible versions if Flutter suggests updates):
```yaml
firebase_core: ^3.15.2
firebase_database: ^11.3.8
```
Run `flutter pub get`, configure Firebase for this Flutter app (recommended: FlutterFire CLI and `flutterfire configure`), and create a Realtime Database in Firebase Console. Set appropriate database rules for your development/testing environment; do not leave a production database publicly writable.
