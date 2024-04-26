class CheckEmailFormModel {
  final String email;

  CheckEmailFormModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;

    return data;
  }
}
