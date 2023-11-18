import 'package:flutter/material.dart';

extension ScreenResponsive on BuildContext {
  double widthFullScreen({double divide = 1}) {
    return MediaQuery.of(this).size.width / divide;
  }

  double heightFullScreen({double divide = 1}) {
    return MediaQuery.of(this).size.height / divide;
  }
}
