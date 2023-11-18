import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/models/task.dart';
import 'package:flutter_todo_project6_supabase/pages/home_page/widgets/checkbox_task.dart';
import 'package:flutter_todo_project6_supabase/services/supabase_function.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/navigator.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SupabaseFunction().getAllTasks(),
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
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                          color: appWhiteTrans,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CheckBoxTask(task: tasks[i]),
                                width16,
                                SizedBox(
                                  height: 130,
                                  width: 200,
                                  child: CustomText(
                                    text: tasks[i].task.toString(),
                                    fontColor: appWhite,
                                    fontSize: 20,
                                    fontFamily: 'Merienda',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: appcoldbage,
                                            title: const CustomText(
                                              text:
                                                  'Are you sure you want to delete your task ?',
                                              fontColor: appgray,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await SupabaseFunction()
                                                      .deleteTask(
                                                          tasks[i].taskId!);
                                                  context.pop();
                                                  setState(() {});
                                                },
                                                child: const CustomText(
                                                  text: 'Yes',
                                                  fontColor: appbrown,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                child: const CustomText(
                                                  text: 'No',
                                                  fontColor: appbrown,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: appColdYellow,
                                  ),
                                )
                              ],
                            )
                          ],
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
