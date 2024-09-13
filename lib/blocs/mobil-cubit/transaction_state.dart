part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default([]) List<String> transactions,
  }) = _TransactionState;
}
