class WithdrawResponseModel {
  String? redirectUrl;
  String? token;

  WithdrawResponseModel({this.redirectUrl, this.token});

  WithdrawResponseModel.fromJson(Map<String, dynamic> json) {
    redirectUrl = json['redirect_url'];
    token = json['token'];
  }
}
