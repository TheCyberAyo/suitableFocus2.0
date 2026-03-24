# Fix “package:flutter … uri_does_not_exist” in the editor

Your project is fine if **`flutter analyze`** (run in this folder) reports no issues. Red squiggles usually mean the editor is **not using the Flutter-aware Dart analyzer**.

## 1. Install the Dart extension (required in Cursor/VS Code)

- Open Extensions and install **Dart** (`Dart-Code.dart-code`).
- Restart the window after install.

## 2. Point the extension at Flutter (if needed)

Flutter SDK on this machine is expected at: `C:\src\flutter`

Workspace settings already set `dart.flutterSdkPath`. If you moved Flutter, update:

- **File → Preferences → Settings** → search **Flutter SDK** / **Dart: Flutter Sdk Path**

Or edit `.vscode/settings.json` in this folder.

## 3. Open the correct folder

Open the **`suitable_focus`** folder (where `pubspec.yaml` lives), or open **`suitable_focus.code-workspace`** from the parent directory.

## 4. Restore package resolution

```bash
cd suitable_focus
flutter pub get
```

## 5. Reload the editor

Command Palette → **Developer: Reload Window** (or **Dart: Restart Analysis Server**).

---

**Note:** Running plain `dart analyze` on a single file *without* a Flutter package context can show the same errors; use **`flutter analyze`** from the `suitable_focus` directory to validate the app.
