part of 'data_plan_bloc.dart';

@freezed
class DataPlanState with _$DataPlanState {
  const factory DataPlanState.initial() = _Initial;
  const factory DataPlanState.loading() = _Loading;
  const factory DataPlanState.success() = _Success;
  const factory DataPlanState.failed(String e) = _Failed;
}

// sealed class DataPlanState extends Equatable {
//   const DataPlanState();

//   @override
//   List<Object> get props => [];
// }

// final class DataPlanInitial extends DataPlanState {}

// final class DataPlanLoading extends DataPlanState {}

// final class DataPlanSuccess extends DataPlanState {}

// final class DataPlanFailed extends DataPlanState {
//   final String e;
//   const DataPlanFailed(this.e);

//   @override
//   List<Object> get props => [e];
// }
