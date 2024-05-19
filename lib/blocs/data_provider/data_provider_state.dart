part of 'data_provider_bloc.dart';

sealed class DataProviderState extends Equatable {
  const DataProviderState();

  @override
  List<Object> get props => [];
}

final class DataProviderInitial extends DataProviderState {}

final class DataProviderLoading extends DataProviderState {}

final class DataProviderSuccess extends DataProviderState {
  final List<DataProviderModel> data;
  const DataProviderSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class DataProviderFailed extends DataProviderState {
  final String e;
  const DataProviderFailed(this.e);

  @override
  List<Object> get props => [e];
}
