import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/data_provider/usecase/data_provider_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(DataPlanLoading());

          final res = await postDataPackageCase(event.data);

          if (res.valid) {
            emit(DataPlanSuccess());
          } else {
            emit(DataPlanFailed(res.message));
          }
        } catch (e) {
          emit(DataPlanFailed(e.toString()));
        }
      }
    });
  }
}
