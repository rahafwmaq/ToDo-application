import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/pages/tasks_state/complete_task_card.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/navigator.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/screen_resposive.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/background_tamplate.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';

class CompleteTask extends StatefulWidget {
  const CompleteTask({super.key});

  @override
  State<CompleteTask> createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundTamplate(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SafeArea(
              child: SizedBox(
                height: context.heightFullScreen(),
                width: context.widthFullScreen(),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: appWhite,
                            size: 30,
                          ),
                        ),
                        width36,
                        const CustomText(
                          text: "Complete Tasks ",
                          fontFamily: 'Merienda',
                          fontColor: appWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const CompleteTaskCard()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
