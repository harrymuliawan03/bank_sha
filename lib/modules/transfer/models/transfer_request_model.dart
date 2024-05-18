class TransferRequestModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  const TransferRequestModel({this.amount, this.pin, this.sendTo});

  TransferRequestModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      TransferRequestModel(
          amount: amount ?? this.amount,
          pin: pin ?? this.pin,
          sendTo: this.sendTo);

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
