# ⚡ Fix: Flutter Hot Reload Not Updating UI on Web or Mobile

A quick reference guide on why pressing `r` (Hot Reload) might not update your screen immediately, and how to fix it permanently.

---

## 📌 The Golden Rule
> **Hot Reload (`r`) ONLY re-runs the `build()` methods of custom widgets.**
> **It NEVER re-runs `main()`!**

---

## 🚨 The Main Problem: Writing UI Directly Inside `main()`

If your file looks like this:

```dart
// ❌ WRONG: Hot Reload ('r') WILL NOT WORK
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      color: Colors.blue, // ⚠️ Changing this and pressing 'r' does NOTHING!
      child: Center(
        child: Text('Hello'),
      ),
    ),
  ));
}
```

### Why does this fail?
1. The `main()` function only runs **once** when you launch the application.
2. When you modify code and press **`r`**, Flutter looks for custom widget `build()` methods to re-execute.
3. Since your code is directly inside `main()`, there is no `build()` method to call. Flutter will **not** re-run `main()`, so your screen never updates until you manually refresh the whole browser.

---

## ✅ The Solution: Wrap Your UI in a `StatelessWidget`

Separate the app startup (`main()`) from the UI (`build()`):

```dart
// ✅ CORRECT: Hot Reload ('r') works INSTANTLY!
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // main() runs once to start the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Flutter re-runs this build() method every time you press 'r'!
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.blue, // Changes will reflect immediately on 'r'
        child: const Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
```

---

## ⌨️ Terminal Shortcuts Cheatsheet

| Key in Terminal | Command | What it does | When to use |
| :---: | :--- | :--- | :--- |
| **`r`** | **Hot Reload** | Re-executes `build()` methods (~200ms) | For visual changes: text, colors, padding, layout |
| **`R`** *(Shift + R)* | **Hot Restart** | Re-runs `main()` and resets state (~1s) | Changed variables, `initState()`, or **Flutter Web** |
| **`c`** | **Clear Console** | Clears terminal logs | Clean up the console |
| **`q`** | **Quit** | Shuts down the dev server | When you are done testing |

---

## 🌐 Extra Tip for Flutter Web
- On Flutter Web, press uppercase **`R`** (Hot Restart) directly in the terminal if lowercase `r` doesn't catch your update.
- **You do NOT need to click the browser refresh button!** Pressing **`R`** takes under 1 second and keeps your debug session active.

---

## 📋 Decision Matrix: What to press?

| What changed in your code? | What to press? |
| :--- | :---: |
| Changed colors, text, styles, or padding inside `build()` | **`r`** |
| Added / moved widgets inside `build()` | **`r`** |
| Changed code directly inside `main()` | **`R`** |
| Changed global variables, constants, or `initState()` | **`R`** |
| Hot reload is stuck or not responding on Chrome/Web | **`R`** |
| Added new images/fonts in `pubspec.yaml` or added packages | **`q`** then re-run `flutter run` |

