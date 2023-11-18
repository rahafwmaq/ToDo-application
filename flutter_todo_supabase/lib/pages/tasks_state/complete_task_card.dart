import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/models/task.dart';
import 'package:flutter_todo_project6_supabase/services/supabase_function.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';

class CompleteTaskCard extends StatefulWidget {
  const CompleteTaskCard({super.key});

  @override
  State<CompleteTaskCard> createState() => _CompleteTaskCardState();
}

class _CompleteTaskCardState extends State<CompleteTaskCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SupabaseFunction().getCompleteTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Task> tasks = snapshot.data!;
            if (tasks.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 270),
                child: Center(
                  child: CustomText(
                    fontFamily: "Merienda",
                    text: "No Task For Today ;)",
                    fontColor: appWhite,
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              );
            }
            return Column(
              children: [
                for (int i = 0; i < tasks.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                          color: appWhiteTrans,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: SizedBox(
                          height: 100,
                          width: 200,
                          child: CustomText(
                            text: '⦿ ${tasks[i].task.toString()}',
                            fontColor: appWhite,
                            fontSize: 20,
                            fontFamily: 'Merienda',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                  ),
                height18
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.hasError.toString());
            return const Text("--- Error ---");
          }
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Center(
                child: CircularProgressIndicator(
              color: appColdYellow,
            )),
          );
        });
  }
}
