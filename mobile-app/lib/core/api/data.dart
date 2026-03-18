class Data {
  String? token;
  String? idCustomer;
  dynamic fcmToken;
  int? exp;

  Data({this.token, this.idCustomer, this.fcmToken, this.exp});

  @override
  String toString() {
    return 'Data(token: $token, idCustomer: $idCustomer, fcmToken: $fcmToken, exp: $exp)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        idCustomer: json['id_customer'] as String?,
        fcmToken: json['fcm_token'] as dynamic,
        exp: json['exp'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'id_customer': idCustomer,
        'fcm_token': fcmToken,
        'exp': exp,
      };
}
