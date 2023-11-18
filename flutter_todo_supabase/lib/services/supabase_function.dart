import 'dart:developer';

import 'package:flutter_todo_project6_supabase/models/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunction {
  Future<List<Task>> getAllTasks() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('task').select('*');
    //log(data.toString());

    List<Task> tasksList = [];

    for (var element in data) {
      tasksList.add(Task.fromJson(element));
    }
    return tasksList;
  }

  Future<List<Task>> getCompleteTasks() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('task').select().eq('is_complete', true);
    log(data.toString());

    List<Task> tasksList = [];

    for (var element in data) {
      tasksList.add(Task.fromJson(element));
    }
    return tasksList;
  }

  Future<List<Task>> getNotCompleteTasks() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('task').select().eq('is_complete', false);
    log(data.toString());

    List<Task> tasksList = [];

    for (var element in data) {
      tasksList.add(Task.fromJson(element));
    }
    return tasksList;
  }

  addNewTask(String task) async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('task').insert({"task": task}).select();

    print(data);
  }

  updateStateTask(bool isComplete, int id) async {
    final supabase = Supabase.instance.client;
    final data = await supabase
        .from('task')
        .update({"is_complete": isComplete}).eq('task_id', id);

    print(data);
  }

  deleteTask(int id) async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('task').delete().eq('task_id', id);

    print(data);
  }
}
