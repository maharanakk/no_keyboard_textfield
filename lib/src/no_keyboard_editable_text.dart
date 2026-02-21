import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text input widget that keeps focus but prevents
/// mobile & Windows touch keyboard from appearing.
/// Useful for barcode scanners & hardware keyboards.
class NoKeyboardEditableText extends EditableText {
  NoKeyboardEditableText({
    super.key,
    required super.controller,
    required super.style,
    required super.cursorColor,
    super.autofocus = false,
    super.selectionColor,
    required ValueChanged<String> onSubmitted,
  }) : super(
          focusNode: NoKeyboardEditableTextFocusNode(),
          backgroundCursorColor: cursorColor,
          onSubmitted: onSubmitted,
          enableInteractiveSelection: true,
          contextMenuBuilder: (context, state) {
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: state.contextMenuAnchors,
              buttonItems: state.contextMenuButtonItems,
            );
          },
        );

  @override
  EditableTextState createState() => NoKeyboardEditableTextState();
}

class NoKeyboardEditableTextState extends EditableTextState {

  bool get _isMobile =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  bool get _isDesktop =>
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux;

  @override
  void requestKeyboard() {
    super.requestKeyboard();

    if (kIsWeb) return;

    // 🔹 Mobile: hide soft keyboard
    if (_isMobile) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }

    // 🔹 Windows/Linux: close text input connection
    if (_isDesktop) {
      SystemChannels.textInput.invokeMethod('TextInput.clearClient');
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    if (kIsWeb) return true;

    // Prevent OS keyboard on mobile & desktop
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux) {
      return false;
    }

    return true;
  }
}