import 'package:bank_sha/database/database.dart';
import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/modules/home/usecase/home_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void updateTransaction(List<String> transactions) async {
    emit(state.copyWith(transactions: transactions));
  }
}
