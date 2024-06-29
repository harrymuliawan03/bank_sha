part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionsGet extends TransactionEvent {
  final AppDatabase database;
  const TransactionsGet(this.database);
}

class TransactionGetLocal extends TransactionEvent {
  final AppDatabase database;
  const TransactionGetLocal(this.database);
}
