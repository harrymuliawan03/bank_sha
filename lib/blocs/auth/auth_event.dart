part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmailExist extends AuthEvent {
  final CheckEmailFormModel email;
  const AuthCheckEmailExist(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserModel user;
  final ProfileEditFormModel data;
  const AuthUpdateUser(this.user, this.data);

  @override
  List<Object> get props => [user, data];
}

class AuthUpdatePin extends AuthEvent {
  final UserModel user;
  final ProfileEditPinFormModel data;
  const AuthUpdatePin(this.user, this.data);

  @override
  List<Object> get props => [user, data];
}

class AuthUpdateBalance extends AuthEvent {
  final int amount;
  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}

class AuthDecreaseBalance extends AuthEvent {
  final int amount;
  const AuthDecreaseBalance(this.amount);

  @override
  List<Object> get props => [amount];
}

class AuthLogout extends AuthEvent {}
