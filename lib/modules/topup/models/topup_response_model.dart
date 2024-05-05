class TopupResponseModel {
  String? redirectUrl;
  String? token;

  TopupResponseModel({this.redirectUrl, this.token});

  TopupResponseModel.fromJson(Map<String, dynamic> json) {
    redirectUrl = json['redirect_url'];
    token = json['token'];
  }
}
