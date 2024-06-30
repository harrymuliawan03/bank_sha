import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/database/services/transaction/transaction_db_case.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/usecase/home_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionsGet>(_onTransactionsGet);
    // on<TransactionGetLocal>(_onTransactionGetLocal);
  }
  Future<void> _onTransactionsGet(
      TransactionsGet event, Emitter<TransactionState> emit) async {
    try {
      emit(TransactionLoading());

      final res = await getTransactionsCase(event.database);

      if (res.valid) {
        emit(TransactionSuccess(res.data!));
      } else {
        emit(TransactionFailed(res.message));
      }
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  // Future<void> _onTransactionGetLocal(
  //     TransactionGetLocal event, Emitter<TransactionState> emit) async {
  //   try {
  //     final res = await TransactionDbCase.getTransactions(event.database);
  //     emit(TransactionLocalSuccess(res));
  //   } catch (e) {
  //     emit(TransactionFailed(e.toString()));
  //   }
  // }
}
