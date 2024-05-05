import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/modules/topup/usecase/topup_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopupPost) {
        try {
          final res = await topupCase(event.data);

          if (res.valid) {
            emit(TopupSuccess(res.data?.redirectUrl ?? ''));
          } else {
            emit(TopupFailed(res.message));
          }
        } catch (e) {
          emit(TopupFailed(e.toString()));
        }
      }
    });
  }
}
