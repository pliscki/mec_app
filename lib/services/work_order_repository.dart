import 'package:meta/meta.dart';
import 'package:mec_app/api/work_order_api.dart';
import 'package:mec_app/models/work_order/work_order.dart';

class WorkOrderRepository {
  final WorkOrderApiClient workOrderApiClient;

  WorkOrderRepository({@required this.workOrderApiClient})
      : assert(workOrderApiClient != null);

  Future<List<WorkOrder>> fetchWorkOrders() async {    
    return await workOrderApiClient.fetchWorkOrders();
  }      
}
