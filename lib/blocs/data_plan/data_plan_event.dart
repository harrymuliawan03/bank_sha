part of 'data_plan_bloc.dart';

sealed class DataPlanEvent extends Equatable {
  const DataPlanEvent();

  @override
  List<Object> get props => [];
}

class DataPlanPost extends DataPlanEvent {
  final DataPlanRequestModel data;
  const DataPlanPost(this.data);

  @override
  List<Object> get props => [data];
}
