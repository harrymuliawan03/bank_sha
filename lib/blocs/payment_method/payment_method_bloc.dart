import 'package:bank_sha/modules/topup/models/payment_method_model.dart';
import 'package:bank_sha/modules/topup/usecase/topup_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMethodLoading());
          final res = await getPaymentMethodCase();

          if (res.valid) {
            emit(PaymentMethodSuccess(res.data!));
          } else {
            emit(PaymentMethodFailed(res.message));
          }
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}
