/*import 'package:meta/meta.dart';
import 'package:mec_app/modules/api/work_order_api.dart';
import 'package:mec_app/models/work_order.dart';


abstract class BaseRepository {
  Future<List<T>> fetchData() async {
    
  }
}

class WorkOrderRepository {
  final WorkOrderApiClient workOrderApiClient;

  WorkOrderRepository({@required this.workOrderApiClient})
      : assert(workOrderApiClient != null);

  Future<List<WorkOrder>> fetchWorkOrders() async {
    return workOrderApiClient.fetchWorkOrders();
  }      
}
*/