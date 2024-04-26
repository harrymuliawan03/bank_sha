import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_form_model.dart';
import 'package:bank_sha/modules/profile/usecase/profile_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileEdit) {
        try {
          emit(ProfileLoading());

          final res = await editProfileCase(event.data);

          if (res.valid) {
            emit(ProfileSuccess());
          } else {
            emit(ProfileFailed(res.message));
          }
        } catch (e) {
          emit(
            ProfileFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
