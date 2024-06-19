import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/usecase/data_provider_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_provider_event.dart';
part 'data_provider_state.dart';
part 'data_provider_bloc.freezed.dart';

class DataProviderBloc extends Bloc<DataProviderEvent, DataProviderState> {
  DataProviderBloc() : super(const _Initial()) {
    on<DataProviderEvent>((event, emit) async {
      await event.when(
        getDataProvider: () async {
          try {
            emit(const DataProviderState.loading());

            final res = await getDataProvidersCase();

            if (res.valid) {
              emit(DataProviderState.success(res.data!));
            } else {
              emit(DataProviderState.failed(res.message));
            }
          } catch (e) {
            emit(DataProviderState.failed(e.toString()));
          }
        },
      );
    });
  }
}
