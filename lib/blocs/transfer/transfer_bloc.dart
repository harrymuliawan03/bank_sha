import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/transfer/usecase/transfer_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {});
  }
}
