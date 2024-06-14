part of 'data_plan_bloc.dart';

@freezed
class DataPlanEvent with _$DataPlanEvent {
  const factory DataPlanEvent.buyDataPlan(
      {required DataPlanRequestModel data}) = _BuyDataPlan;
}
