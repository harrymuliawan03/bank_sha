class ProfileEditPinFormModel {
  final String? prevPin;
  final String? newPin;

  ProfileEditPinFormModel({
    this.prevPin,
    this.newPin,
  });

  Map<String, dynamic> toJson() {
    return {
      'previous_pin': prevPin,
      'new_pin': newPin,
    };
  }
}
