import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:mec_app/models/work_order/work_order.dart';

abstract class WorkOrderState extends Equatable {
  WorkOrderState([List props = const []]) : super(props);
}

class WorkOrderEmpty extends WorkOrderState {}

class WorkOrderLoading extends WorkOrderState {}

class WorkOrderLoaded extends WorkOrderState {
  final List<WorkOrder> workOrders;
  WorkOrderLoaded({@required this.workOrders})
      : assert(workOrders != null),
        super([workOrders]);
}

class WorkOrderError extends WorkOrderState {}
