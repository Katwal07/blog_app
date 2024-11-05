abstract class GenericDataState {}

class DataInitial extends GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T? data;
  DataLoaded( {this.data,});
}

class FailureLoadData extends GenericDataState {
  final String errorMessage;

  FailureLoadData({required this.errorMessage});
}
