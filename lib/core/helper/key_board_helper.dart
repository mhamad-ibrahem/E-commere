import 'package:flutter/material.dart';

class KeyBoardHelper {
  static closeKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static focusOnTextField(
      {required BuildContext context, required FocusNode focusNode}) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
