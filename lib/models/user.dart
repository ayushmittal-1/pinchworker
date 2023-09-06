class UserModel {
  String? uid;
  String? email;
  String? name;
  String? pushToken;
  List<dynamic>? cars = [];
  int? dp;

  UserModel(
      {this.uid, this.email, this.name, this.pushToken, this.cars, this.dp});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    pushToken = json['pushToken'];
    cars = json['cars'];
    dp = json['dp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['pushToken'] = pushToken;
    data['cars'] = cars;
    data['dp'] = dp;
    return data;
  }
}
