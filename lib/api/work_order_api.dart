import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:mec_app/models/work_order/work_order.dart';
import 'dart:convert';

class WorkOrderApiClient {
  static const baseUrl = "http://192.168.0.12:3000";
  final http.Client httpClient;
  //http.Response response;

  WorkOrderApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<WorkOrder>> fetchWorkOrders() async {
    final workOrdersUrl = '$baseUrl/work_orders';

    final response = await httpClient.get(workOrdersUrl).catchError((error) => print(error));    

    if (response.statusCode != 200) {
      throw Exception('Error getting list of work orders');
    }

    final woJson = jsonDecode(response.body);
    //return (woJson as List).map((item) => WorkOrder.fromJson(item));
    return woJson.map<WorkOrder>((item) => WorkOrder.fromJson(item)).toList(); 
  }
}
