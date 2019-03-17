import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'work_order_event.dart';
import 'work_order_state.dart';
import 'package:mec_app/services/work_order_repository.dart';
import 'package:mec_app/models/work_order/work_order.dart';

export 'work_order_event.dart';
export 'work_order_state.dart';


class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final WorkOrderRepository workOrderRepository;

  WorkOrderBloc({@required this.workOrderRepository})
      : assert(workOrderRepository != null);

  @override
  WorkOrderState get initialState => WorkOrderEmpty();

  @override
  Stream<WorkOrderState> mapEventToState(
    WorkOrderState currentState,
    WorkOrderEvent event,
  ) async* {
    if (event is FetchWorkOrder) {
      yield WorkOrderLoading();
      try {
        final List<WorkOrder> workOrders =
            await workOrderRepository.fetchWorkOrders();
        yield WorkOrderLoaded(workOrders: workOrders);
      } catch (_) {
        yield WorkOrderError();
      }
    }
  }
}
