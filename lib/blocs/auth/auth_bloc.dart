import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/modules/auth/models/check_email_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/auth/services/auth_services.dart';
import 'package:bank_sha/modules/auth/usecase/auth_case.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_form_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_pin_form_model.dart';
import 'package:bank_sha/modules/profile/usecase/profile_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final DataPlanBloc dataPlanBloc = DataPlanBloc();

    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmailExist) {
          try {
            emit(AuthLoading());

            final res = await checkEmailExistCase(event.email);

            if (res.data == false) {
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

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final res = await registerCase(event.data);

            if (res.valid) {
              emit(AuthSuccess(res.data!));
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthLogin) {
          try {
            emit(AuthLoading());

            final res = await loginCase(event.data);
            if (res.valid) {
              emit(AuthSuccess(res.data!));
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthUpdateUser) {
          try {
            emit(AuthLoading());

            final res = await editProfileCase(event.data);

            if (res.valid) {
              final updatedUser = event.user.copyWith(
                username: event.data.username,
                name: event.data.name,
                email: event.data.email,
                password: event.data.password,
              );
              emit(AuthSuccess(updatedUser));
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthUpdatePin) {
          try {
            emit(AuthLoading());

            final res = await editPinCase(event.data);

            if (res.valid) {
              final updatedUser = event.user.copyWith(
                pin: event.data.newPin,
              );
              emit(AuthSuccess(updatedUser));
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthUpdateBalance) {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copyWith(
                  balance: (state as AuthSuccess).user.balance! + event.amount,
                );

            emit(AuthSuccess(updateUser));
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            final SignInFormModel data =
                await AuthServices().getCredentialFromLocal();

            final res = await loginCase(data);

            if (res.valid) {
              UserModel user = res.data!;
              emit(AuthSuccess(user));
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthLogout) {
          try {
            emit(AuthLoading());

            final res = await logoutCase();

            if (res.valid) {
              emit(AuthInitial());
            } else {
              emit(AuthFailed(res.message));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
      },
    );
  }
}
