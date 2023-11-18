import 'package:flutter/material.dart';
import 'package:flutter_todo_project6_supabase/pages/home_page/widgets/filter.dart';
import 'package:flutter_todo_project6_supabase/services/supabase_function.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/navigator.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/background_tamplate.dart';
import 'package:flutter_todo_project6_supabase/pages/home_page/widgets/task_card.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/layout.dart';
import 'package:flutter_todo_project6_supabase/utils/extension/screen_resposive.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_buttom.dart';
import 'package:flutter_todo_project6_supabase/utils/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundTamplate(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SafeArea(
              child: SizedBox(
                height: context.heightFullScreen(),
                width: context.widthFullScreen(),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "To Do List :",
                          fontFamily: 'Merienda',
                          fontColor: appWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        Row(
                          children: [
                            // ----------- add new task ------------------------
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: appcoldbage,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    final newTaskController =
                                        TextEditingController();
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                          left: 20,
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: SizedBox(
                                        width: context.widthFullScreen(),
                                        height: 300,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              width: 300,
                                              child: TextField(
                                                style: const TextStyle(
                                                    fontFamily: 'Merienda',
                                                    color: appgray,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: newTaskController,
                                                maxLines: 100,
                                                decoration:
                                                    const InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      appWhite),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      appWhite),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            fontFamily:
                                                                'Merienda',
                                                            color: appgray,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        hintText:
                                                            "add new task"),
                                              ),
                                            ),
                                            height20,
                                            CustomButtom(
                                              textButtom: 'Add task',
                                              onPressed: () {
                                                SupabaseFunction().addNewTask(
                                                    newTaskController.text);

                                                context.pop();
                                                SupabaseFunction()
                                                    .getAllTasks();
                                                setState(() {});
                                                context
                                                    .findAncestorStateOfType<
                                                        HomePageState>()
                                                    ?.setState(() {});
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.assignment_add,
                                size: 35,
                                color: appWhiteTrans,
                              ),
                            ),

                            // ----------- Filter Task is complete or not ------
                            const Filter()
                          ],
                        )
                      ],
                    ),
                    height18,
                    const TaskCard()
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
