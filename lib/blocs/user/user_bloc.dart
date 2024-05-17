import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/usecase/user_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetRecentUsers) {
        try {
          emit(UserLoading());

          final res = await getRecentUsersCase();

          if (res.valid) {
            emit(UserSuccess(res.data!));
          } else {
            emit(UserFailed(res.message));
          }
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserGetUserByUsername) {
        try {
          emit(UserLoading());

          final res = await getUserByUsernameCase(event.username);

          if (res.valid) {
            emit(UserSuccess(res.data!));
          } else {
            emit(UserFailed(res.message));
          }
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
