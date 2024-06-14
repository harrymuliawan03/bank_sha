import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/data_provider/usecase/data_provider_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';
part 'data_plan_bloc.freezed.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(const _Initial()) {
    on<DataPlanEvent>((event, emit) async {
      await event.when(
        buyDataPlan: (data) async {
          try {
            emit(const DataPlanState.loading());
            final res = await postDataPackageCase(data);
            if (res.valid) {
              emit(const DataPlanState.success());
            } else {
              emit(DataPlanState.failed(res.message));
            }
          } catch (e) {
            emit(DataPlanState.failed(e.toString()));
          }
        },
      );
    });
  }
}
