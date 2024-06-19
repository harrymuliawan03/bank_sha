part of 'data_provider_bloc.dart';

@freezed
class DataProviderState with _$DataProviderState {
  const factory DataProviderState.initial() = _Initial;
  const factory DataProviderState.loading() = _Loading;
  const factory DataProviderState.success(List<DataProviderModel> data) =
      _Success;
  const factory DataProviderState.failed(String e) = _Failed;
}
