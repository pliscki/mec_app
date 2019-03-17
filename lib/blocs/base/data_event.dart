import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  DataEvent([List props = const []]): super(props);
}

class FetchData extends DataEvent {
  FetchData (); 
}