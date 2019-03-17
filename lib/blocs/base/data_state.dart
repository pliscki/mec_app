import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  DataState([List props = const []]) : super(props);
}

class DataEmpty extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final dynamic data;
  DataLoaded({@required this.data})
      : assert(data != null),
        super([data]);
}

class DataError extends DataState {}
