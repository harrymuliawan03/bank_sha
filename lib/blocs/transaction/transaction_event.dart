part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionsGet extends TransactionEvent {}

class TransactionGetLocal extends TransactionEvent {
  final DriftIsolate driftIsolate;
  final AppDatabase db;
  const TransactionGetLocal(this.driftIsolate, this.db);
}
