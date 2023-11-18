

class Task {
  int? taskId;
  String? task;
  bool? isComplete;

  Task({this.taskId, this.task, this.isComplete});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    task = json['task'];
    isComplete = json['is_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['task'] = this.task;
    data['is_complete'] = this.isComplete;
    return data;
  }
}