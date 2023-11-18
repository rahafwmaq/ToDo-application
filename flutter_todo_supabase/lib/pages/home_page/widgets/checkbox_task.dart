import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/models/task.dart';
import 'package:flutter_todo_project6_supabase/services/supabase_function.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';

class CheckBoxTask extends StatefulWidget {
  const CheckBoxTask({super.key, required this.task});
  final Task task;
  @override
  State<CheckBoxTask> createState() => _CheckBoxTaskState();
}

class _CheckBoxTaskState extends State<CheckBoxTask> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    //isComplete = widget.task.isComplete!;
    setState(() {});
    return GestureDetector(
      onTap: () {
        setState(() {
          isComplete = !isComplete;
          print(isComplete);

          SupabaseFunction().updateStateTask(isComplete, widget.task.taskId!);
        });
      },
      child: AnimatedContainer(
        height: 20,
        width: 20,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isComplete ? appColdYellow : appcoldbage,
            border: Border.all(
              color: isComplete ? appColdYellow : appcoldbage,
            )),
        child: isComplete
            ? const Icon(
                Icons.check_rounded,
                color: appgray,
                size: 20,
              )
            : null,
      ),
    );
  }
}
