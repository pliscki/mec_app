import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

enum LineType { Part, Labour, Fuel, Tire, Misc, Comment, Unknown }

class TaskDetail extends Equatable {
  final int sequence;
  final LineType lineType;
  final String lineCode;
  final double quantity;
  final double price;
  final double total;

  TaskDetail(
      {@required this.sequence,
      this.lineType,
      this.lineCode,
      this.quantity,
      this.price,
      this.total})
      : super([
          sequence,
          lineType,
          lineCode,
          quantity,
          price,
          total,
        ]);

  static TaskDetail fromJson(Map<String,dynamic> json) {    
    return TaskDetail(
        sequence: json['id'] as int,
        lineType: _mapLineType(json['lineType']),
        lineCode: json['lineCode'],
        quantity: json['quantity'].toDouble(),
        price: json['price'].toDouble(),
        total: json['total'].toDouble());
  }

  static LineType _mapLineType(String input) {
    LineType state;
    switch (input) {
      case "L":
        state = LineType.Labour;
        break;
      case "P":
        state = LineType.Part;
        break;
      case "F":
        state = LineType.Fuel;
        break;
      case "T":
        state = LineType.Tire;
        break;
      case "M":
        state = LineType.Misc;
        break;
      case "C":
        state = LineType.Comment;
        break;
      default:
        state = LineType.Unknown;
        break;
    }
    return state;
  }
}
