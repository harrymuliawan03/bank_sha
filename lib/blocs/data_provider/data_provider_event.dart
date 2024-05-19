part of 'data_provider_bloc.dart';

sealed class DataProviderEvent extends Equatable {
  const DataProviderEvent();

  @override
  List<Object> get props => [];
}

class DataProviderGet extends DataProviderEvent {}
