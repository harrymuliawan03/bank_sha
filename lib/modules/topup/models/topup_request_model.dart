class TopupRequestModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  const TopupRequestModel({
    this.amount,
    this.paymentMethodCode,
    this.pin,
  });

  TopupRequestModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopupRequestModel(
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
