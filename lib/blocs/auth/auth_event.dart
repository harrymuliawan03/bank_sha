part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmailExist extends AuthEvent {
  final String email;
  const AuthCheckEmailExist(this.email);

  @override
  List<Object> get props => [email];
}
