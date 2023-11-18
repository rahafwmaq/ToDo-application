import 'package:flutter/material.dart';

class BackgroundTamplate extends StatelessWidget {
  const BackgroundTamplate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/backgroundTamplate.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
