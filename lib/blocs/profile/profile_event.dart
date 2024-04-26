part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileEdit extends ProfileEvent {
  final ProfileEditFormModel data;
  const ProfileEdit(this.data);

  @override
  List<Object> get props => [data];
}
