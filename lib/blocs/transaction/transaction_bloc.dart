import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/usecase/home_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionsGet) {
        try {
          emit(TransactionLoading());

          final res = await getTransactionsCase();

          if (res.valid) {
            emit(TransactionSuccess(res.data!));
          } else {
            emit(TransactionFailed(res.message));
          }
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
