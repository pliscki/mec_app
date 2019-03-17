import 'package:flutter/foundation.dart';
import 'task_detail.dart';
import 'package:equatable/equatable.dart';

enum TaskType { Accident, CVIP, PrevMaintenace, Repair, Unknown }

class WorkOrderTask extends Equatable {
  final String taskCode;
  final TaskType taskType;
  final String taskDescription;
  final String taskMemo;
  final List<TaskDetail> taskDetails;

  WorkOrderTask({
    @required this.taskCode,
    this.taskType,
    this.taskDescription,
    this.taskMemo,
    this.taskDetails,
  }) : super([
          taskCode,
          taskType,
          taskDescription,
          taskMemo,
          taskDetails,
        ]) ;

  static WorkOrderTask fromJson(Map<String, dynamic> json) {
    return WorkOrderTask(
      taskCode: json['id'],
      taskType: _mapTaskType(json['taskType']),
      taskDescription: json['taskDescription'],
      taskMemo: json['taskMemo'],  
      taskDetails: (json['taskDetails'] as List).map((item) => TaskDetail.fromJson(item)).toList(),    
    );
  }

  static TaskType _mapTaskType(String input) {
    switch (input) {
      case "A":
        return TaskType.Accident;
        break;
      case "C":
        return TaskType.CVIP;
        break;
      case "P":
        return TaskType.PrevMaintenace;
        break;
      case "R":
        return TaskType.Repair;
        break;
      default:
        return TaskType.Unknown;
        break;
    }
  }

  /*UnmodifiableListView<TaskDetail> get taskDetails =>
      UnmodifiableListView(_taskDetails);

  void addDetail(TaskDetail taskDetail) {
    this._taskDetails.add(taskDetail);
  } */
}
