## Support the Project ❤️

If this package helps you in production or saves development time, consider supporting ☕

[![Buy Me a Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee\&slug=maharanadev)](https://www.buymeacoffee.com/maharanadev)


# No Keyboard TextField

A Flutter widget that allows text input **without opening the soft keyboard** while keeping focus active.

Designed for **barcode scanners, RFID readers, kiosks, and hardware keyboard workflows**.

Unlike a normal `TextField`, this widget accepts input but prevents the OS virtual keyboard from appearing.

---

## Why this package?

In many enterprise apps (warehouse, logistics, POS, factory systems), input comes from a **scanner device**, not a user typing.

Normal TextField behavior:

* Focus gained → mobile keyboard opens
* UI blocked
* Scanner workflow disturbed

This widget:

* Keeps focus
* Accepts input
* Blocks virtual keyboard

Perfect scanner UX 🚀

---

## Features

✔ Prevents soft keyboard (Android & iOS)
✔ Prevents Windows touch keyboard (TabTip)
✔ Keeps focus active
✔ Supports barcode & hardware scanners
✔ Works in kiosk mode
✔ Desktop typing works normally
✔ Adaptive selection toolbar
✔ Zero dependencies

---

## Platform Support

| Platform | Supported |
| -------- | --------- |
| Android  | ✅         |
| iOS      | ✅         |
| Windows  | ✅         |
| Linux    | ✅         |
| macOS    | ✅         |
| Web      | ✅         |

---

## Installation

Add dependency:

```yaml
dependencies:
  no_keyboard_textfield: ^1.0.3
```

Then run:

```
flutter pub get
```

---

## Usage

```dart
final controller = TextEditingController();

NoKeyboardEditableText(
  controller: controller,
  autofocus: true,
  style: const TextStyle(fontSize: 18, color: Colors.black),
  cursorColor: Colors.blue,
  onSubmitted: (value) {
    print("Scanned: $value");
  },
)
```

---

## Common Use Cases

• Warehouse scanning apps
• Delivery tracking systems
• POS billing software
• Self-service kiosks
• Industrial tablets
• Attendance systems (RFID/QR)

---

## How it works

The widget overrides Flutter’s `EditableText` input connection:

* Mobile → hides soft keyboard
* Windows → clears text input client (prevents touch keyboard)
* Desktop/Web → keeps normal typing behavior

So scanner input works without UI interruption.

---

## Notes

Some barcode scanners automatically send an **ENTER key** after scan.
Use `onSubmitted` to capture full scan value.

---

## Example Workflow

1. User taps field → no keyboard opens
2. Scanner scans barcode
3. Value appears instantly
4. ENTER triggers submit

Smooth enterprise UX ✔

---

## Contributing

Pull requests and feature suggestions are welcome.

If you use this package in a production app, feel free to share feedback.

---

## License

MIT License
