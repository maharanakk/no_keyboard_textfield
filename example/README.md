# No Keyboard TextField

A Flutter widget that allows text input without opening mobile soft keyboard.
Ideal for barcode scanners and hardware keyboards.

## Features
✔ Keeps focus
✔ Blocks soft keyboard (Android/iOS)
✔ Works on Desktop/Web normally

## Usage

```dart
NoKeyboardEditableText(
  controller: controller,
  style: TextStyle(fontSize: 18),
  cursorColor: Colors.blue,
  onSubmitted: (value) {},
);
