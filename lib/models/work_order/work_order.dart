import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'unit.dart';
import 'work_order_task.dart';

//exports
export 'work_order_task.dart';
export 'task_detail.dart';
export 'unit.dart';

class WorkOrder extends Equatable {
  final int woNumber;
  final DateTime woDate;
  final Unit unit;
  final List<WorkOrderTask> workOrderTasks;

  WorkOrder({
    @required this.woNumber,
    this.woDate,
    this.unit,
    this.workOrderTasks,
  }) : super([
          woNumber,
          woDate,
          unit,
          workOrderTasks,
        ]);

  static WorkOrder fromJson(Map<String, dynamic> json) {
    return WorkOrder(
      woNumber: json['id'],
      woDate: DateTime.parse(json['woDate']),
      unit: Unit.fromJson(json['Unit']),
      workOrderTasks:
          (json['tasks'] as List).map((item) => WorkOrderTask.fromJson(item)).toList(),
    );
  }

  /*UnmodifiableListView<WorkOrderTask> get workOrderTasks => UnmodifiableListView(_workOrderTasks);

  void addTask(WorkOrderTask workOrderTask) {
    _workOrderTasks.add(workOrderTask);
  }*/
}
