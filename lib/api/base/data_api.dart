/*import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:mec_app/models/work_order.dart';
import 'dart:convert';

abstract class Data<T> {

}

abstract class DataApi<T> {
  final String baseUrl;
  final http.Client httpClient;
  http.Response response;

  DataApi({
    @required this.baseUrl,
    @required this.httpClient, 
  }) : assert(baseUrl != null, httpClient != null,);

  Future<List<Data>> fetchData(String _endPoint) async {
    final urlEndpoint = '$baseUrl/$_endPoint';

    response = await httpClient.get(urlEndpoint).catchError((error) => print(error));

    if (response.statusCode != 200 ) {
      throw Exception('Error getting data from API');
    }

    final json = jsonDecode(response.body);

    return json.map<Data>((item) => Data)

  }
}

class WorkOrderApiClient {
  static const baseUrl = "http://10.0.2.2:3000";
  final http.Client httpClient;
  http.Response response;

  WorkOrderApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<WorkOrder>> fetchWorkOrders() async {
    final workOrdersUrl = '$baseUrl/work_orders';

    response =
        await httpClient.get(workOrdersUrl).catchError((error) => print(error));

    if (response.statusCode != 200) {
      throw Exception('Error getting list of work orders');
    }

    final woJson = jsonDecode(response.body);
    //return (woJson as List).map((item) => WorkOrder.fromJson(item));
    return woJson.map<WorkOrder>((item) => WorkOrder.fromJson(item)).toList();
  }
}
*/