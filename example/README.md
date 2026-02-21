## Support the Project ❤️

If this package helped you, consider buying me a coffee ☕

[![Buy Me a Coffee](https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=maharanadev&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff)](https://www.buymeacoffee.com/maharanadev)

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
