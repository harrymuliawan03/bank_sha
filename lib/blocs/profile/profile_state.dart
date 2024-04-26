part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFailed extends ProfileState {
  final String e;
  const ProfileFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class ProfileSuccess extends ProfileState {}


// final class AuthSuccess extends ProfileState {
//   final UserModel data;
//   const AuthSuccess(this.data);

//   @override
//   // TODO: implement props
//   List<Object> get props => [data];
// }

// final class LogoutSuccess extends ProfileState {}