import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/pages/tasks_state/complete_task.dart';
import 'package:flutter_todo_project6_supabase/pages/tasks_state/not_complete_task.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/navigator.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: appcoldbage,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: TextButton(
              onPressed: () {
                context.push(page: const CompleteTask());
              },
              child: const CustomText(
                text: " Complete Tasks",
                fontColor: appgray,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ),
        PopupMenuItem(
          child: TextButton(
              onPressed: () {
                context.push(page: const NotCompleteTask());
              },
              child: const CustomText(
                text: "Not Complete Tasks",
                fontColor: appgray,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ),
      ],
      child: const Icon(
        Icons.filter_alt_outlined,
        color: appWhiteTrans,
        size: 40,
      ),
    );
  }
}
