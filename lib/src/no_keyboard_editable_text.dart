import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text input widget that keeps focus but prevents
/// mobile soft keyboard from appearing.
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
  @override
  void requestKeyboard() {
    super.requestKeyboard();

    if (kIsWeb) return;

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    if (kIsWeb) return true;

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return false;
    }
    return true;
  }
}
