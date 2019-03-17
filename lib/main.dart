import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:mec_app/services/base/simple_bloc_delegate.dart';
import 'package:mec_app/services/work_order_repository.dart';
import 'package:mec_app/api/work_order_api.dart';
import 'package:http/http.dart' as http;
import 'package:mec_app/pages/work_order/work_order_page.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final WorkOrderRepository workOrderRepository = WorkOrderRepository(
    workOrderApiClient: WorkOrderApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(
    workOrderRepository: workOrderRepository,
  ));
}

class MyApp extends StatelessWidget {
  final WorkOrderRepository workOrderRepository;

  MyApp({this.workOrderRepository});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WorkOrderPage(
      workOrderRepository: workOrderRepository,
    );
  }
}
