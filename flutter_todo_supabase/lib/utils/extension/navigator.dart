import 'package:flutter/material.dart';

extension NavigatorTo on BuildContext {
  void pushAndRemoveUntil({required Widget page}) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  void push({required Widget page}) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
