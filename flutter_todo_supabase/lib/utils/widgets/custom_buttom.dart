import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key, required this.textButtom, required this.onPressed});

  final String textButtom;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: appWhite),
        child: Center(
            child: Text(
          textButtom,
          style: const TextStyle(
              color: appgray, letterSpacing: 2, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
