import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/usecase/data_provider_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_provider_event.dart';
part 'data_provider_state.dart';

class DataProviderBloc extends Bloc<DataProviderEvent, DataProviderState> {
  DataProviderBloc() : super(DataProviderInitial()) {
    on<DataProviderEvent>((event, emit) async {
      if (event is DataProviderGet) {
        try {
          emit(DataProviderLoading());

          final res = await getDataProvidersCase();

          if (res.valid) {
            emit(DataProviderSuccess(res.data!));
          } else {
            emit(DataProviderFailed(res.message));
          }
        } catch (e) {
          emit(DataProviderFailed(e.toString()));
        }
      }
    });
  }
}
