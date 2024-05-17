part of 'transfer_bloc.dart';

sealed class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class TransferGetUserByUsername extends TransferEvent {
  final String username;
  const TransferGetUserByUsername(this.username);

  @override
  List<Object> get props => [username];
}