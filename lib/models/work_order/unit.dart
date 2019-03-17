import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class Unit extends Equatable {
  final String unitCode;
  final int year;
  final String make;
  final String model;

  Unit({
    @required this.unitCode,
    this.year,
    this.make,
    this.model,
  }) : super([
          unitCode,
          year,
          make,
          model,
        ]);

  static Unit fromJson(Map<String, dynamic> json) {    
    return Unit(
      unitCode: json['id'],
      year: json['year'],
      make: json['make'],
      model: json['model'],
    );
  }
}
