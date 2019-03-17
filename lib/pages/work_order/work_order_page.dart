import 'package:flutter/material.dart';
import 'package:mec_app/services/work_order_repository.dart';
import 'package:mec_app/blocs/work_order/work_order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mec_app/models/work_order/work_order.dart';

class WorkOrderPage extends StatefulWidget {
  final WorkOrderRepository workOrderRepository;

  WorkOrderPage({Key key, @required this.workOrderRepository})
      : assert(workOrderRepository != null),
        super(key: key);

  @override
  State<WorkOrderPage> createState() => _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage> {
  WorkOrderBloc _workOrderBloc;
  @override
  void initState() {
    super.initState();
    _workOrderBloc =
        WorkOrderBloc(workOrderRepository: widget.workOrderRepository);        
    _workOrderBloc.dispatch(FetchWorkOrder());
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Orders',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Work Orders'),
        ),
        body: Center(
          child: BlocBuilder(
            bloc: _workOrderBloc,
            builder: (_, WorkOrderState state) {
              if (state is WorkOrderEmpty) {
                return Center(
                  child: Text('No Data'),
                );
              }
              if (state is WorkOrderLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WorkOrderLoaded) {
                final workOrders = state.workOrders;                
                return ListView(
                  children: workOrders.map<Widget>((WorkOrder workOrder) {
                    return _createWOCard(
                        context, workOrder, (woNumber) => print(woNumber));
                  }).toList(),
                );
              }
              if (state is WorkOrderError) {
                return Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                );
              }
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Work Order List'),
                decoration: BoxDecoration(color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _workOrderBloc.dispose();
    super.dispose();
  }
}

void _doNothing() {
  print('Tap 2');
}

Widget _createWOCard(context, WorkOrder workOrder, _onTap) {
  return Card(
    child: InkWell(
      onTap: () {
        _onTap(workOrder.woNumber);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'W.O: ' + workOrder.woNumber.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    workOrder.woDate.toString(),
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    workOrder.unit.unitCode,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    workOrder.unit.model,
                    style: TextStyle(fontSize: 15.00),
                  ),
                  Text(
                    workOrder.unit.make,
                    style: TextStyle(fontSize: 15.00),
                  )
                ],
              ),
            ),
            ButtonTheme.bar(
              padding: EdgeInsets.all(2.0),
              child: ButtonBar(
                children: <Widget>[
                  MaterialButton(
                    child: Text('VIEW DETAILS'),
                    onPressed: () {
                      _doNothing();
                    },
                  ),
                  MaterialButton(
                    child: Text('SUBMIT W.O'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Submit W.O'),
                            content: Text('Confirm submitting Work Order?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('NO'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text('YES'),
                                onPressed: () {},
                              ),
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
