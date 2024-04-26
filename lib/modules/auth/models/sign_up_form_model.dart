class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (pin != null) data['pin'] = pin;
    if (profilePicture != null) data['profile_picture'] = profilePicture;
    if (ktp != null) data['ktp'] = ktp;

    return data;
  }

  SignUpFormModel copyWith({
    String? name,
    String? email,
    String? password,
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
