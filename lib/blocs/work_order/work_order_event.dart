import 'package:equatable/equatable.dart';

abstract class WorkOrderEvent extends Equatable {
  WorkOrderEvent([List props = const []]): super(props);
}

class FetchWorkOrder extends WorkOrderEvent {
  FetchWorkOrder (); 
}