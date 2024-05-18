import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/transfer/models/transfer_request_model.dart';
import 'package:bank_sha/modules/transfer/usecase/transfer_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if (event is TransferPost) {
        try {
          emit(TransferLoading());

          final res = await transferCase(event.data);

          if (res.valid) {
            emit(TransferSuccess());
          } else {
            emit(TransferFailed(res.message));
          }
        } catch (e) {
          emit(TransferFailed(e.toString()));
        }
      }
    });
  }
}
