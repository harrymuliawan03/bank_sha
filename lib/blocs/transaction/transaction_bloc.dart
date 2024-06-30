import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/database/services/service_database.dart';
import 'package:bank_sha/database/services/transaction/transaction_db_case.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/usecase/home_case.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/isolate.dart';
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
      final driftIsolate = await ServiceDatabase.createDriftIsolate();
      final dbConnection = await driftIsolate.connect();
      final db = AppDatabase.connect(dbConnection);
      emit(TransactionLoading());

      print('tes');
      final transactions = await _onTransactionGetLocal(driftIsolate, db);
      print('tes2');
      final res = await getTransactionsCase(db);
      print('tes3');

      if (res.valid) {
        emit(TransactionSuccess(res.data!));
      } else {
        emit(TransactionSuccess(transactions));
      }
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  Future<List<TransactionModel>> _onTransactionGetLocal(
      DriftIsolate driftIsolate, AppDatabase db) async {
    try {
      final res = await _fetchTransactionsUsingIsolate(driftIsolate, db);
      print(res);
      return res;
    } catch (e) {
      return [];
    }
  }

  Future<List<TransactionModel>> _fetchTransactionsUsingIsolate(
      DriftIsolate driftIsolate, AppDatabase db) async {
    return TransactionDbCase.getTransactions(db);
  }
}
