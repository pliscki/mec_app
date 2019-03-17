import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable  {

  BaseModel(args) :super([]);  

  static BaseModel fromJson(Map<String, dynamic> json){
    
  }

}