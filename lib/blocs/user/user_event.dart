part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserGetUserByUsername extends UserEvent {
  final String username;
  const UserGetUserByUsername(this.username);

  @override
  List<Object> get props => [username];
}

class UserGetRecentUsers extends UserEvent {}
