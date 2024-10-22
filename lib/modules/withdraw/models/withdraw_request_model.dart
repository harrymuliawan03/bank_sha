class WithdrawRequestModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  const WithdrawRequestModel({
    this.amount,
    this.paymentMethodCode,
    this.pin,
  });

  WithdrawRequestModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      WithdrawRequestModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethodCode,
      };
}
