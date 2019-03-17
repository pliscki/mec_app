import 'package:flutter/material.dart';

class WorkOrderDetail extends StatelessWidget {
  WorkOrderDetail();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Card(),
        ),
        Expanded(
          child: ListView(children: <Widget>[],),
        ),
      ],
    );
  }
}
