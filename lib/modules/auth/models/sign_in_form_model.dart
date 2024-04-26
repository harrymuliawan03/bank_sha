class SignInFormModel {
  final String? email;
  final String? password;

  SignInFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;

    return data;
  }
}
