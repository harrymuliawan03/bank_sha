import 'package:bank_sha/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmailExist) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().checkEmailExist(event.email);

          if (res == false) {
            emit(AuthCheckEmailExistSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai'));
          }
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
